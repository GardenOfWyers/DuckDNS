#!/bin/bash

# DuckDNS variables
DOMAINS=""
TOKEN=""

# Log file variables
LOG_FILE=~/duckdns/duck.log
LOG_LENGTH=1000 # lines

# Make sure log file exists
touch $LOG_FILE

# Ensure log does not go beyond LOG_LENGTH lines (desired number of lines minus 1 because another one is about to be written below)
tail -n $((LOG_LENGTH-1)) $LOG_FILE | sponge $LOG_FILE

SITE="https://www.duckdns.org/update?domains=${DOMAINS}&token=${TOKEN}"
# Log file stores URL HTTP_VERSION HTTP_RESPONSE_CODE TOTAL_TIME_OF_ACTION_IN_SECONDS
echo "[$(date -u)] $(/usr/bin/curl -s -o dev/null -I -w "${SITE} HTTP/%{http_version} %{http_code} %{time_total}" $SITE)" >> $LOG_FILE
