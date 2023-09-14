#!/usr/bin/env bash

#Basch Scripting Hands-On task 1
##########################
#jq -r '.[] | keys[]' test.json
#jq -r '.map_for_groups | keys[]' test.json
##########################


#Basch Scripting Hands-On task 2
##########################
#https://www.youtube.com/watch?v=tGOzGPEpmlI
#https://www.howtogeek.com/409611/how-to-view-free-disk-space-and-disk-usage-from-the-linux-terminal/#:~:text=Bash%20contains%20two%20useful%20commands,terminal%20window%20to%20get%20started.
#https://www.linkedin.com/learning/learning-bash-scripting-17063287/conditional-statements-with-the-if-keyword?dApp=53239054&leis=LAA&resume=false&u=2113185

#TO="mendozaarturo1221@gmail.com"
#disk_util=75
#filesystem_value=$(df -h --total | grep total | awk '{print $5}' | tr -d "%")
#echo $filesystem_value
#if [ "$filesystem_value" -lt "85" ]; then
 #   echo "Everything ok, sending email just to mention that Filesystem storage is less than 85%"
  #  echo "Subject: Fylesystem total is less than 85%"|sendmail $TO  
   # echo "done, in theory" 
#fi

# https://www.digitalocean.com/community/tutorials/send-email-linux-command-line#5-using-sendmail
#echo "Mail test" | mail -s "test" mendozaarturo1221@gmail.com
##########################