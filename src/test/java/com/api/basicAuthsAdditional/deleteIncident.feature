Feature: User get the incident details 

Background: Setup baseURL 
	* def getresponse = call read("patchIncident.feature") {_url: 'https://dev68166.service-now.com', _path: '/api/now/v1/table/incident/', _sd: 'my new update from delete method'}
	* def sysid = getresponse.response.result.sys_id
	* def shortdesp = getresponse.response.result.short_description
	* print "short_description = "+shortdesp
	* print "sysid = "+sysid 
	Given url 'https://dev68166.service-now.com' 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
	
Scenario: User delete the created item 
	Given path '/api/now/v1/table/incident/',sysid 
	And request { "short_description": "seku short desc" } 
	When method delete 
	Then status 204 
	And match response.length() == 0
	
	
Scenario: verify sysid after deleted 
	* def getresponse = call read("getIncident.feature") {_url: 'https://dev68166.service-now.com', _path: '/api/now/v1/table/incident', _fields: 'number, sys_id, short_description', _sysid: '#(sysid)'}
	Given print getresponse