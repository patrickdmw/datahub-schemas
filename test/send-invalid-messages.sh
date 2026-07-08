#!/bin/bash

topic_prefix=${1:-uns}

# empty data is invalid for any topic
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/parts-produced" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {}}"
# data must contain "goodParts" and "badParts"
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/parts-produced" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"goodParts\": 100}}"
# good and bad parts must be a number
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/parts-produced" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"goodParts\": 100, \"badParts\": \"none\"}}"

# valid states are "running", "idle", "error", NOT "offline"
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-state" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"state\": \"offline\"}}"
# valid error reasons are "stuck", "burning", "spinning"
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-state" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"state\": \"error\", \"errorReason\": \"broken\"}}"

# lat and long must be between -90 and 90
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-location" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"currentPosition\": {\"latitude\": 100, \"longitude\": \
  -1.264}}}"
# long must be set
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-location" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"currentPosition\": {\"latitude\": 15.5498}}}"
# if previous position is set, it must be valid
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-location" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"currentPosition\": {\"latitude\": 19.5465, \"longitude\": \
  -1.64898}, \"previousPosition\": {}}}"