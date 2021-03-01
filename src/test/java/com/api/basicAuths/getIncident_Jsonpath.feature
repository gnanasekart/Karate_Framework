@Regression @full
Feature: User get the incident details 

Background: Setup baseURL 
	Given url 'https://dev68166.service-now.com' 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
	
Scenario: User login into service 
	Given path '/api/now/v1/table/incident' 
	And param sysparm_fields = 'number, sys_id, priority, short_description, sys_class_name' 
	When method get 
	Then status 200 
	#And print response
	#And print response.result[0] 
	And match response == '#notnull' 
	#http://jsonpath.com/
	And def priority = karate.jsonPath(response, "$..[?(@.priority==4)].sys_id")
	And print priority