#!/bin/bash
set -e
environment=$1
source "$environment"Environment/backendService.properites 

echo "login to integration cloud"
curl -c /tmp/cookie -X POST -k "$SERVER_URL/appmgt/site/blocks/user/login/ajax/login.jag" -d "action=login&userName=$clouduser&password=$clouduserpass"

appStatusCode=$(curl -w "%{http_code}" -b /tmp/cookie -X POST "$SERVER_URL/appmgt/site/blocks/application/application.jag" -d "action=getApplication&applicationName=$APPLICATION_NAME")
echo $appStatusCode
if [[ $appStatusCode == "200" ]]
then
appHashId=$(curl -b /tmp/cookie -X POST "$SERVER_URL/appmgt/site/blocks/application/application.jag" -d "action=getApplication&applicationName=$APPLICATION_NAME" |jq -r .hashId)

if [[ ! -z $appHashId ]] 
then
 curl -b /tmp/cookie -X POST $SERVER_URL/appmgt/site/blocks/application/application.jag -F action=deleteApplication -F applicationKey=$appHashId
fi
fi

echo "deploy backend service to integration cloud"
curl -b /tmp/cookie -X POST $SERVER_URL/appmgt/site/blocks/application/application.jag -F action=createApplication -F applicationName=$APPLICATION_NAME -F applicationDescription=$APPLICATION_NAME -F runtime=26 -F appTypeName=mss -F applicationRevision=$APPLICATION_VERSION -F uploadedFileName=$DEPLOYABLE_ARTIFACT_NAME -F runtimeProperties=[] -F tags=[] -F fileupload=@$DEPLOYABLE_ARTIFACT_PATH/$DEPLOYABLE_ARTIFACT_NAME -F isFileAttached=true -F conSpec=2 -F isNewVersion=false -F appCreationMethod=default -F setDefaultVersion=true

echo "application was successfully deployed"
