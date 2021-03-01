Feature: User get the incident details and eternal data 

Background: Setup the baseURL 
	Given url 'https://dev68166.service-now.com' 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
	
Scenario: User login into service and validate json data 
	Given path '/api/now/v1/table/incident' 
	And param sysparm_fields = 'number, sys_id, priority, short_description, sys_class_name' 
	When method get 
	Then status 200 
	#read value
	And def actualresp = read("classpath:com/api/automation_resource/jsonResponse.json") 
	And print "json file = ", actualresp 
	And match response == actualresp