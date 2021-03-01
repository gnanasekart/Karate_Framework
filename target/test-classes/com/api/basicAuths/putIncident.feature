Feature: User get the incident details 

Background: Setup baseURL 
	Given url 'https://dev68166.service-now.com' 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 

@Smoke @full	
Scenario: User login into service 
	* def getresponse = call read("classpath:com/api/automation_resource/getIncident_Request.feature") {_url: 'https://dev68166.service-now.com', _path: '/api/now/v1/table/incident', _sysparam: 'number, sys_id, priority, short_description, sys_class_name'}
	#* print "get details ==> ", getresponse.response.result[0].sys_id
	* def sysid = getresponse.response.result[0].sys_id
	* print "sysid = "+sysid
	Given path '/api/now/v1/table/incident/',sysid 
	
	And request { "short_description": "seku short desc" }
	When method put 
	Then status 200 
	And print response
	