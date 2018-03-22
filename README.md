

## Getting started guide

This example demonstrate a sample CI/CD pipeline for API Management using [WSO2 API Management](https://wso2.com/api-management/) solution combined with Travis CI and Newman.

![](https://lh5.googleusercontent.com/dYoaXQQ7CyLGXjWo6YTZDzCUKQpyevq-UlYbzdFrMYLuSQG1J6A4vFZvc4TvPLqZC-4p_Zg7qlek9oo3wiQEdGlDbCCFj8YQpSlJq0rij5kK-_KhmcF7NzWXrBmeM3F3onw4PGpM)

  

Check out the [Travis build](https://travis-ci.org/manjulaRathnayaka/API-Management-CI-CD-Example/builds/356742320) here.

  

# To try out this with your repository

1.  Sign up to WSO2 API Cloud at [https://wso2.com/api-management/cloud/](https://wso2.com/api-management/cloud/)
    
2.  Upon signup, you will have following details with you.   

    Username - [user@gmail.com](mailto:user@gmail.com)
    
    Password - xxx
    
    Organization - DevMyOrg

    

3.  [Login](http://cloudmgt.cloud.wso2.com/cloudmgt/) to WSO2 Cloud and create another organization. Each environment is represented as an organization. For example, you will have DevMyOrg and StagingMyOrg organizations. You can find instruction on creating new organization [here](https://docs.wso2.com/display/IdentityCloud/Cloud+Administration#CloudAdministration-Addaneworganization).
    
4.  Fork this git repository.
    
5.  Configure Dev environment.
    

	1.  Update DevEnvironment/backendService.properites file to set the correct git repository path.  DEPLOYABLE\_ARTIFACT\_PATH=/home/travis/build/<YourGitHubOrganizationName>/API-Management-CI-CD-Example/BackendServiceImpl/Hello-Service/target
    
	2.  Update DevEnvironment/Development.postman_environment.json to set your organization name.   

		    {
		    
		    "enabled": true,
		    
		    "key": "tenantDomain",
		    
		    "value": "**YourWSO2CloudDevOrganizationKey**",
		    
		    "type": "text"
		    
		    }
		    
		    {
		    
		    "enabled": true,
		    
		    "key": "backendAPIEndpoint",
		    
		    "value": "https://<**YourWSO2CloudDevOrganizationKey**>-helloservice-1-0-0.wso2apps.com",
		    
		    "type": "text"
		    
		    }

  

 1.  Configure Staging environment.
	   
	 1. Update StagingEnvironment/backendService.properites file to set the
	    correct git repository path. 
	            DEPLOYABLE\_ARTIFACT\_PATH=/home/travis/build/<YourGitHubOrganizationName>/API-Management-CI-CD-Example/BackendServiceImpl/Hello-Service/target
	    
	 2. Update StagingEnvironment/Development.postman_environment.json to set your
	        organization name.

            
        
        	    {
        	    
        	    "enabled": true,
        	    
        	    "key": "tenantDomain",
        	    
        	    "value": "YourWSO2CloudStagingOrganizationKey",
        	    
        	    "type": "text"
        	    
        	    }
        	    
        	    {
        	    
        	    "enabled": true,
        	    
        	    "key": "backendAPIEndpoint",
        	    
        	    "value": "https://<YourWSO2CloudStagingOrganizationKey>-helloservice-1-0-0.wso2apps.com",
        	    
        	    "type": "text"
        	    
        	    }

 3. Commit and push above changes to git repository.
    
6.  Configure Travis	
    1. Go to [https://travis-ci.org/](https://travis-ci.org/) and sign in
    with Github.
    	    
    2. Allow permissions to let travis to access your forked repository.
    	    
    3.  Go to your profile and select the GitHub account and the forked repository to enable building your repository.
    	    
    4.  Add following environment variables from More Options -> Settings. Below credentials are the credentials you use to login to
    WSO2 Cloud.
    	    
    
    	 devclouduser=[user@gmail.com](mailto:user@gmail.com)@DevMyOrg
    	    
    	 devclouduserpass=xxx
    	  
    	 stagingclouduser=[user@gmail.com](mailto:user@gmail.com)@StagingMyOrg
    	    
    	 stagingclouduserpass=xxx
    	    
    
    5.  If the build is not started yet, commit a minor change to your git repository to start it.

    

That is it. Now you can refer the build log to understand the execution flow. Note that this is a very simple .travis.yml configuration and you may use advanced features of travis to configure different states etc.

  

Once you have successfully completed the above tasks, login to [WSO2 API Cloud](http://api.cloud.wso2.com/publisher/) to view the APIs published as well as to [WSO2 Integration Cloud](http://integration.cloud.wso2.com/appmgt/) to view the micro service deployed.

  

By now, you have successfully deployed an micro service and exposed it as a API in WSO2 Cloud. Let’s consider updating the micro service and propagating those changes to Dev, Staging environments to see your changes are getting reflected correctly.

1.  Modify the source of BackendServiceImpl/Hello-Service/src/main/java/org/example/service/HelloService.java to include additional resource paths. You can refer to [WSO2 Microservices Framework for Java(MSF4J)](https://github.com/wso2/msf4j) to learn more about microservices.
    
2.  Update the swagger file at DeployAPI/swagger.json. Note that you need to have info section in swagger file.
    
3.  Update the postman script at TestAPI/WSO2\_API\_STORE\_TESTS.postman\_collection.json to reflect your changes.
    
4.  Commit and push all above changes and monitor the travis build.


