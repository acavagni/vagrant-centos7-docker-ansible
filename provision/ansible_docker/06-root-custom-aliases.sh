#
# this script is used to push custom aliases definitions inside the vagrant VM
# 
# aliases defined here are intended to be system wide
# 

echo "alias vi='vim'" >> /etc/profile.d/custom_aliases.sh
echo "alias dudir='find . -maxdepth 1 -type d | grep -v ^\\.$ | xargs -i du -sk {} | sort -n | awk \"{sum+=\\\$1;print}END{print \\\"TOTAL: \\\"sum/1024\\\"MB\\\"}\"'" >> /etc/profile.d/custom_aliases.sh
