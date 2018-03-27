#!/bin/bash

cd /
NETWORK_ID=22346 ./start.sh &

cd /augur.js

echo "Resting for a bit"
sleep 10s

USE_NORMAL_TIME=false node scripts/dp deploy

$(kill -9 $(pidof geth))
