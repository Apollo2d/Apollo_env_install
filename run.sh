#!/bin/bash
# set -x

# This is a demo to run two team and server

RESULT=./result
LOG_1=~/Desktop/Apollo_env_install/1.log
LOG_2=~/Desktop/Apollo_env_install/2.log
team_1=~/Desktop/robocup/CYRUS

team_2=~/Desktop/robocup/apollo2d-exe

rcssserver > $RESULT 2>&1 &
SERVER=$!
# rcssmonitor > $RESULT 2>&1 &
sleep 1

{
cd $team_1
./start.sh > $LOG_2 2>&1 
}&

{
cd $team_2
./start.sh > $LOG_1 2>&1 &
}&

echo $SERVER

trap "kill $SERVER;exit" INT

while true
do
	echo "1"
done
