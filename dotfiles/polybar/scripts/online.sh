#!/bin/sh

if ping -c 1 8.8.8.8 &> /dev/null
then
  echo "%{B#504945} Online  %{B-}"
else
  echo "%{B#9d0006}  Offline  %{B-}"
fi

