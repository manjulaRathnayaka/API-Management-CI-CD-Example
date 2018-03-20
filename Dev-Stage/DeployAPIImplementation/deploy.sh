#!/bin/bash
SERVER_URL=https://integration.cloud.wso2.com
echo "login to integration cloud"
curl -c cookies -X POST -k "$SERVER_URL/appmgt/site/blocks/user/login/ajax/login.jag" -d "action=login&userName=$clouduser&password=$clouduserpass"
echo "deploy micro service into integration cloud"
curl -v -b cookies -X POST $SERVER_URL/appmgt/site/blocks/application/application.jag -F action=createApplication -F applicationName=apps -F applicationDescription=desc -F runtime=26 -F appTypeName=mss -F applicationRevision=1.0.0 -F uploadedFileName=Hello-Service-0.1-SNAPSHOT.jar -F runtimeProperties=[] -F tags=[] -F fileupload=@/home/travis/build/manjulaRathnayaka/API-Management-CI-CD-Example/APIImplementation/Hello-Service/target/Hello-Service-0.1-SNAPSHOT.jar -F isFileAttached=true -F conSpec=2 -F isNewVersion=false -F appCreationMethod=default -F setDefaultVersion=true
