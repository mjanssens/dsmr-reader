#!/bin/bash


# Sending a HANGUP signal to Gunicorn's master process will gracefully reload its children.
echo ""
printf "%-50s" " * Reloading process: dsmr_webinterface (Gunicorn)"

if [ -f /var/tmp/gunicorn--dsmr_webinterface.pid ];
then
    cat /var/tmp/gunicorn--dsmr_webinterface.pid | xargs kill -HUP
    echo "   [OK]"
else
    echo "   [??] PID file does not exist"
fi


# Management commands have some builtin mechanism for this as well.
printf "%-50s" " * Reloading process: dsmr_backend"
if [ -f /var/tmp/dsmrreader--dsmr_backend.pid ];
then
    cat /var/tmp/dsmrreader--dsmr_backend.pid | xargs kill -HUP
    echo "   [OK]"
else
    echo "   [??] PID file does not exist"
fi


printf "%-50s" " * Reloading process: dsmr_datalogger"

if [ -f /var/tmp/dsmrreader--dsmr_datalogger.pid ];
then
    cat /var/tmp/dsmrreader--dsmr_datalogger.pid | xargs kill -HUP
    echo "   [OK]"
else
    echo "   [??] PID file does not exist"
fi


printf "%-50s" " * Reloading process: dsmr_mqtt"

if [ -f /var/tmp/dsmrreader--dsmr_mqtt.pid ];
then
    cat /var/tmp/dsmrreader--dsmr_mqtt.pid | xargs kill -HUP
    echo "   [OK]"
else
    echo "   [??] PID file does not exist"
fi
