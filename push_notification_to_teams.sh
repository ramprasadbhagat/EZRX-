#!/bin/bash 

STR=$(yq '.version' pubspec.yaml)
VERSION=$( echo $STR | cut -d '+' -f 1 )
BUILD=$( echo $STR | cut -d '+' -f 2 )
TITLE="Integration Test eZRx+ $( echo $VERSION )($( echo $BUILD ))"
curl --location --request POST $MICROSOFT_TEAMS_BUILD_CHANNEL \
--header 'Content-Type: text/plain' \
--data-raw '{
  "@type": "MessageCard",
  "@context": "http://schema.org/extensions",
  "summary": "Mobile Integration Test WAS DONE",
  "sections": [{
    "activityTitle": "'"$TITLE"'",
      "markdown": true
    }],
  "potentialAction": [{
    "@type": "ActionCard",
    "name": "Build url",
    "actions": [