#!/bin/bash

# CentOs 6 security announce checker
# by Irek Pelech (c) 2015

# Get dates
TDATE=$(date +"%Y-%B")
TODAY="$(date +"%d-%m-%Y").security.txt"
YESTERDAY="$(date +"%d-%m-%Y" --date="yesterday").security.txt"

# Get annoucements from CentOs 
curl -s https://lists.centos.org/pipermail/centos-announce/$TDATE/date.html|grep Security|grep "CentOS 6"|sed -e 's/<[^>]*>//g'|tac|awk '!seen[$2]++' > $TODAY

# Diff between days for new announcement 

diff --changed-group-format='%<' --unchanged-group-format='' $TODAY $YESTERDAY > ./changes.txt
if [ -s ./changes.txt ]; then
	echo -e "<!DOCTYPE html>\n<html>\n<body>\n\n<span style=\"font-weight: bold; color: red;\">NEW -> " > ./email.body.txt
	sed 's/.*/&\<br\>/' ./changes.txt >> ./email.body.txt
	echo -e "</span><br>" >> ./email.body.txt
	sed 's/.*/&\<br\>/' $YESTERDAY >> ./email.body.txt
	echo -e "<br>\n\n" >> ./email.body.txt
	echo -e "For more information about these security updates please visit <a
 href=\"https://lists.centos.org/pipermail/centos-announce/$TDATE/date.html\">https://lists.centos.org/pipermail/centos-announce/$TDATE/date.html</a><br>" >> ./email.body.txt
 
	echo -e "</body>\n</html>\n" >> ./email.body.txt

	# send email
	mutt -e 'my_hdr From: <your_send_email_here>' -e 'set content_type=text/html' -s 'CentOS security announcement' 'recipient1,recipient2,...' < email.body.txt
fi

# Clear files older than 7 days
find . -name "*.security.txt" -mtime +7 -delete
