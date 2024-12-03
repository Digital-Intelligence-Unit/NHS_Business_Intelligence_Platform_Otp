#!/bin/bash

# Copy graph files
cp -r /mnt/efs/otp /mnt/cache

# Run jar
java -Xmx10G -D'dw.graphhopper.datareader.file=/var/otp/data/lsc.osm.pbf' -jar /var/otp/graphhopper-web-9.1.jar server config.yml