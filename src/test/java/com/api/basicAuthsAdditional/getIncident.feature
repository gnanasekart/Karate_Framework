Feature: User get the incident details 

Background: Setup baseURL 
	Given url _url 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
	
Scenario: User get details to validate deleted items availbility
	Given path _path 
	And param sysparm_fields = _fields 
	When method get 
	Then status 200 
	#And print response
	And match response == '#notnull' 
	And def priority = karate.jsonPath(response, "$..[?(@.sys_id=='#(_sysid)')].number")
	And print priority
	#And match priority == '#null' 

	
	