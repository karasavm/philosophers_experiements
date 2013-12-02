#!/bin/bash
EXPECTED_ARGS=3

if [ $# -ne $EXPECTED_ARGS ]
then
  echo 'Wrong Number of Parameters'
  echo "Usage: launchCreator NUM_OF_PHILOSOPHERS NUM_OF_FORKS_PER_PHILOSOPHER NUM_OF_TOTAL_FORKS"
  exit -1
fi

echo '<launch>'
echo '<param name="/philosophers/max_eating_time" type="int" value="5" />
<param name="/philosophers/max_thinking_time" type="int" value="1" />
<node name="stateManager" type="server" pkg="state_manager" respawn="false"/>
<node name="fork_holder" type="RemotePositiveCounter" pkg="remote_counter" respawn="false" args="forkcnt '$3'"/>
<node name="watchdog" type="wdtMonitor" pkg="watchdog_timer" respawn="false"/>'
NUM=$1

for i in $(seq 0 $(($NUM-1)) )
do
  echo '<node name="philosopher'$i'" type="philosopher" pkg="dining_philosopher" respawn="false" args="'$i 'forkcnt' $2'"/>'
done


echo '</launch>'
