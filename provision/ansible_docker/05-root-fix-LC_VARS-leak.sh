cat <<EOF > /etc/profile.d/LC_VARS_leak_fix.sh
# Initialization script for bash

# this is an environment script made in order to fix the messy output
# of certain commands such as "systemd-analyze critical-chain" where
# some punctuation characters could be incorrectly displayed due to a
# a possbile leak of LC_* variable values coming from the vagrant host
# session
# 
# TL;DR: it unset LC_* and override the LC_ALL to en_US.UTF-8
# 

# are we in an interactive shell?
[ -n "\$PS1" ] && {

  # First unset the LC_*
  for var in \$(env | grep '^LC_'); do unset \${var%=*}; done

  # Second override the LC_ALL and set it to en_US.UTF-8
  export LC_ALL=en_US.UTF-8

}
EOF
