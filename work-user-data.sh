#!bin/bash
set -e

{
  echo 'INFO: Setting Hostname'
	hostnamectl set-hostname ${s3d_name}.${s3d_domain}

  echo 'INFO: Allowing all wheel users to sudo without a password'
  sed -i -E 's/^%wheel\t.*\tALL/\%wheel ALL=\(ALL\) NOPASSWD\: ALL/' \
    /etc/sudoers

  echo 'INFO: Creating the "${s3d_user}" user'
  useradd "${s3d_user}" -m
  cd "/home/${s3d_user}"
  usermod -a -G wheel "${s3d_user}"

  echo 'INFO: copying ec2-user keys'
  cp -r /home/ec2-user/.ssh .ssh

  echo 'INFO: Getting ".s3d-setup"'
  wget "https://raw.githubusercontent.com/s3d-club/s3d-dev-setup/${s3d_setup_ref}/s3d-setup-ec2"
  mv s3d-setup-ec2 .s3d-setup-ec2 
  {
    echo '#!/bin/bash'
    echo 'time source ./.s3d-setup-ec2'
  } > .s3d-setup

  echo 'INFO: Adjusting ".bash_profile"'
  {
    echo -e ""
    echo -e "# S3D Setup"
    echo -e "export S3D_DOMAIN"
    echo -e "export S3D_NAME"
    echo -e "export S3D_SETUP_REF"
    echo -e "export S3D_VERSION"
    echo -e "export S3D_ZONE"
    echo -e "S3D_DOMAIN=\"${s3d_domain}\""
    echo -e "S3D_NAME=\"${s3d_name}\""
    echo -e "S3D_SETUP_REF=\"${s3d_setup_ref}\""
    echo -e "S3D_ZONE=\"${s3d_zone}\""
    echo -e "PATH=\"\$HOME/.s3d/scripts:\$PATH\""
    echo -e "PATH=\"\$HOME/.tfenv/bin:\$PATH\""
    echo -e "PATH=\"\$HOME/go/bin:\$PATH\""
    echo -e ""
    echo -e "[ -d \"\$HOME/.s3d/logs\" ] || . \"\$HOME/.s3d-setup\""
  } >> .bash_profile

  echo 'INFO: Setting file ownership'
  chown -R "${s3d_user}:${s3d_user}" "/home/${s3d_user}"

  echo 'INFO: S3D USER DATA COMPLETE'
} >> "$HOME/user-data.log" 2>&1
