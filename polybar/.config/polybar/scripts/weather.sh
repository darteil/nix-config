#!/bin/bash

APIKEY=`cat $HOME/.owm-key`
CITY_NAME='Tomsk'
COUNTRY_CODE='RU'
UNITS="metric"
DECIMALS=0

URL="api.openweathermap.org/data/2.5/weather?appid=$APIKEY&units=$UNITS&lang=$LANG&q=$(echo $CITY_NAME| sed 's/ /%20/g'),${COUNTRY_CODE}"

RESPONSE=""
ERR_MSG=""

function getData {
  ERROR=0
  RESPONSE=`curl -s $URL`
  CODE="$?"
  if [ "$1" = "-d" ]; then
    echo $RESPONSE
    echo ""
  fi
  RESPONSECODE=0
  if [ $CODE -eq 0 ]; then
    RESPONSECODE=`echo $RESPONSE | jq .cod`
  fi
  if [ $CODE -ne 0 ] || [ ${RESPONSECODE:=429} -ne 200 ]; then
    if [ $CODE -ne 0 ]; then
      ERR_MSG="curl Error $CODE"
    else
      ERR_MSG="Conn. Err. $RESPONSECODE"
    fi
      ERROR=1
  fi
}

getData $1

if [ $ERROR -eq 0 ]; then
  TEMP=`echo $RESPONSE | jq .main.temp`
  SPEED=`echo $RESPONSE | jq .wind.speed`
  RESULTTEMP=`printf "%.0f\n" "$TEMP"`
  RESULTSPEED=`printf "%.0f\n" "$SPEED"`
  echo "Temp: ${RESULTTEMP}°C  Wind: ${RESULTSPEED}m/s"
else
  echo $ERR_MSG
fi
