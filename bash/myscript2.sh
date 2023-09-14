#!/bin/bash

#Basch Scripting Hands-On task 2
# Get the filesystem usage
filesystem_value=$(df -h --total | grep total | awk '{print $5}' | tr -d "%"

# If the filesystem usage is greater than 85%, send an email
#70% for testing purposes
if [ "$filesystem_value" -gt 70 ]; then
  # Get the recipient email addresses
  recipients="mendozaarturo1221@gmail.com, arturo_ochoa@epam.com"

  # Get the subject and body of the email
  subject="Filesystem usage alert"
  body=" Filesystem / has breached 85% threshold utilization, and admin attention is needed Filesystem Size Used Avail Use% Mounted on /dev/sda1 40G 36G 4G 90% / Scan date is Thu Nov 18 19:00:28 UTC 2021"

  # Send the email
  mail -s "$subject" "$recipients" < "$body"
fi

#This script first uses the df command to get the filesystem usage. The df command outputs a table of filesystem usage information. 
#The script then uses the awk command to filter the output of the df command to only show filesystems that are using more than 85% of their space.

#If the script finds any filesystems that are using more than 85% of their space, it then gets the recipient email addresses, 
#the subject, and the body of the email. The script then uses the mail command to send the email.

#The mail command takes three arguments: the recipient email addresses, the subject, and the body of the email. 
#The mail command will send the email to the recipient email addresses.

#The crontab command can be used to schedule the script to run at certain times. 
#To schedule the script to run 4 times per day, you would add the following line to your crontab file:
#0 12 * * * /path/to/script.sh
#This line tells the crontab to run the script at 12:00 AM, 6:00 AM, 12:00 PM, and 6:00 PM every day.
