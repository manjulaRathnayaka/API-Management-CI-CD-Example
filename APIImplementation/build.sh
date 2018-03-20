#!/bin/bash
cd Hello-Service
if mvn install | grep -q 'BUILD SUCCESS'; then
  exit 0 
fi
exit 1
