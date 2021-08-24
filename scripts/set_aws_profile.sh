#!/bin/bash

PROFILE=$1

TMP_FILE=/tmp/creds.json

# aws --profile $PROFILE sts get-session-token > $TMP_FILE
unset AWS_ACCESS_KEY_ID
unset AWS_SECRET_ACCESS_KEY
unset AWS_SESSION_TOKEN

/usr/bin/python - << EOF
import boto3
import json
session = boto3.Session(profile_name="$PROFILE")
creds = session.get_credentials()
result = {
  "Credentials": {
    "AccessKeyId": creds.access_key,
    "SecretAccessKey": creds.secret_key,
    "SessionToken": creds.token,
  }
}
with open("$TMP_FILE", "w") as out:
    out.write(json.dumps(result, indent=4))

EOF

export AWS_ACCESS_KEY_ID=$(cat $TMP_FILE | jq .Credentials.AccessKeyId)
export AWS_SECRET_ACCESS_KEY=$(cat $TMP_FILE | jq .Credentials.SecretAccessKey)
export AWS_SESSION_TOKEN=$(cat $TMP_FILE | jq .Credentials.SessionToken)

