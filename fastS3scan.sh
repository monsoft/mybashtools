#!/bin/bash

# Dirty S3 bucket scanner.
# 

# Check if reauired commands are installed
command -v xargs  >/dev/null 2>&1 || { echo "I require xargs  but it's not installed.  Aborting." >&2; exit 1; }
command -v curl  >/dev/null 2>&1 || { echo "I require curl but it's not installed.  Aborting." >&2; exit 1; }

# Help function
function help () {
cat <<EOF
fastS3scan 0.1 (c) 2017 by Irek 'Monsoft' Pelech

Usage: fastS3scan max-procs dictionary-file
Options:
		max-procs		run at to X processes at a time
		dictionary-file		plain text file with bucket names

example:

$ fastS3scan 5 mylist
aaronitic : 404
aarrgh : 404
aarrghh : 404
aaruer : 200
aas : 503

These are 'S3 buckets : HTTP response code'. So we looking for 200 HTTP response code which means that S3 bucket is public.
In our example "aaruer : 200" is Public S3 bucket.

Script works with tor as well: 
$ torsocks fastS3scan 5 mylist
EOF
}

# Check if arguments are provided
if [ $# -ne 2 ]
then
	help
	exit 0
fi

PROCM=$1
WFILE=$2

# Check if ductionary file exist
if [ ! -f $WFILE ]
then
	help | head -n 1
	echo -e "\nDictionary file ${WFILE} don't exist !!!"
	exit 1 
fi

# Run check
cat ${WFILE} |xargs -n 1 -P ${PROCM} -I {} sh -c 'echo "{} : $(curl -s -o /dev/null -I -w '%{http_code}' http://{}.s3.amazonaws.com)"'
