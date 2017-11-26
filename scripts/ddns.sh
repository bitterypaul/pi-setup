#!/bin/sh
link=http://sync.afraid.org/u/y0QWSxaRUCcxgsizoQDyCMSR/

until curl -s $link > /dev/null 2>&1
do
 sleep 15
done

python /home/pi/scripts/py/send_mail.py "Pi started"  "pi started at `date` "  &
sleep 60
curl -s $link >  /dev/null 2>&1

sleep 90

while :
do
    until curl -s $link > /dev/null 2>&1
    do
        sleep 90
    done
    sleep 3600
done
