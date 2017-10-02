# My BASH Tools
This is few bash tools which I wrote to help me in my day-2-day job. I think that some of them still can be usefull so I decided to upload them to GitHub. All these scripts are text one.

##### sTranslate
This is command line google translator which I wrote some times ago to be able to stanslate words and frazes without using graphical webbrowser. Mostly not developed anymore but still in working condition.

##### No-IP DDNS host update
Small script which allow update of dynamic DNS on No-IP DDNS service.

Filename: ipupdate.sh

##### whatismyip
Simply come back with your external IP

##### Playbook mount
Mount BlackBerry Playbook share. It works over USB and use usb0 interface. You have to configure USB connection on BB Playbook to connect with Mac.

Filename: connect_playbook

##### Currency converter
It will convert currency based on google finance converter.

Filename: convert.sh

##### TimeDiff
Calculate amount of time between two times figures. Usefull for calculate working time. I use it when I'm filling Oncall form.

Filename: timediff

##### Mod Security log parser
This is small parser of logs from Mod Security WAF.

Filename: modsecpars

##### Very simply csv to vCard contacts converter
It converts contacts stored in CSV file to vCard format. Wrote it in few minutes to move my phone contacts from Blackberry to iPhone.
Used with ipdparse to extract contacts from IPD format (https://sites.google.com/site/ipdparse/downloads) and iCloud Contacts to upload vCard file.

Filename: csv2vcard.sh

##### FastS3scanner 
It looks for publicly accessible S3 buckets based on list of words provided in text file.
Small, dirty, simple and fast.

Filename: fastS3scan.sh

####  CentOs 6 security announce checker
This script looks on CentOs security patch website and parse information about newest security updates published on it. 
CentOs repositories doesn’t use channels (like Redhat) and there is no way to list/check what are new security updates.

Filenames: centos-secannounce.sh email.body.txt
