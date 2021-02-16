#!/bin/sh
ADDRESS=$1

export SERVER="http://$ADDRESS" && \
export COOKIEJAR="$(mktemp)" && \
CRUMB=$(curl --cookie-jar "$COOKIEJAR" -s "$SERVER/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)") && \
export CURL_CODE=$(curl -X POST --cookie "$COOKIEJAR" -H "$CRUMB" -w "%{http_code}" -s -o /dev/null "$SERVER"/createItem?name=cool_game --data-binary @cool_game.xml -H "Content-Type:text/xml") && if [ "$CURL_CODE" != "200" ]; then echo "None job was created, maybe allready exists"; else echo "Job created correctly"; fi
