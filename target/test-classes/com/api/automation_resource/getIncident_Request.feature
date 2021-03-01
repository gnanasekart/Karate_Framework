Feature: User get the incident details 

Background: Setup baseURL 
	Given url _url 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
	
Scenario: User login into service 
	Given path _path 
	And param sysparm_fields = _sysparam 
	When method get 
	Then status 200 
	#And print response
	And print response.result[0] 
	And def sysid = response.result[0].sys_id
	And match response == '#notnull' 
	And def length = response.result.length 