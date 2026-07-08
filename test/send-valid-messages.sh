#!/bin/bash

topic_prefix=${1:-uns}

mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/parts-produced" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"goodParts\": 100, \"badParts\": 19}}"

mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-state" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"state\": \"running\"}}"
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-state" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"state\": \"error\", \"errorReason\": \"burning\"}}"

mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-location" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"currentPosition\": {\"latitude\": 12.26, \"longitude\": \
  -1.264}}}"
mosquitto_pub \
  -h localhost \
  -p 1883 \
  -t "${topic_prefix}/machine-location" \
  -m "{\"uuid\": \"$(uuid)\", \"timestamp\": \"$(date +%Y-%m-%dT%H:%M:%SZ)\", \"source\": \"mosquitto_pub\", \"data\": {\"currentPosition\": {\"latitude\": 19.5465, \"longitude\": \
  -1.64898}, \"previousPosition\": {\"latitude\": 20.1945, \"longitude\": \
  -3.2194}}}"