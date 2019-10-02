#!/bin/bash

curl -s --socks5-hostname localhost:9050 https://check.torproject.org | awk -F "strong" '/Your IP address appears to be:/ { print $2 }'|tr -d '></'
