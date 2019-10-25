#!/bin/bash

# Common path for all GPIO access
BASE_GPIO_PATH=/sys/class/gpio

# Assign names to GPIO pin numbers for each light
MYLED=17
MYBUTTON=24

# Assign names to states for inputs
IN_ON="0"
IN_OFF="1"

# Assign names to states for outputs
ON="1"
OFF="0"

# Utility function to export a pin if not already exported
exportPin()
{
  if [ ! -e $BASE_GPIO_PATH/gpio$1 ]; then
    echo "$1" > $BASE_GPIO_PATH/export
  fi
}

# Utility function to set a pin as an output
setOutput()
{
  echo "out" > $BASE_GPIO_PATH/gpio$1/direction
}

# Utility function to set a pin as an input
setInput()
{
  echo "in" > $BASE_GPIO_PATH/gpio$1/direction
}

# Utility function to change state of a light
setLightState()
{
  echo $2 > $BASE_GPIO_PATH/gpio$1/value
}

# Utility function to get state of a pin
blocksIfIsOff()
{
  while [ $(cat $BASE_GPIO_PATH/gpio$1/value) = $IN_OFF ]; do : ; done
}

# Utility function to turn all lights off
allLightsOff()
{
  setLightState $MYLED $OFF
}

# Ctrl-C handler for clean shutdown
shutdown()
{
  allLightsOff
  exit 0
}

trap shutdown SIGINT

# Export pins so that we can use them
exportPin $MYBUTTON
exportPin $MYLED

# Set pin as input
setInput $MYBUTTON

# Set pin as output
setOutput $MYLED

# Turn lights off to begin
allLightsOff

# Loop forever until user presses Ctrl-C
while [ 1 ]
do
  blocksIfIsOff $MYBUTTON

  # MYLED on
  setLightState $MYLED $ON
  sleep 2

  # MYLED off
  setLightState $MYLED $OFF
done
























