Feature: User get the incident details 

Background: Setup baseURL 
	Given url _url 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
	
Scenario: User update the table using patch 
	* def getresponse = call read("postIncident.feature") {_url: 'https://dev68166.service-now.com', _path: '/api/now/v1/table/incident', _callerid: 'thomes', _assignto: 'myself'}
	* def sysid = getresponse.response.result.sys_id
	* def shortdesp = getresponse.response.result.short_description
	* print "short_description = "+shortdesp
	* print "sysid = "+sysid
	Given path _path,sysid
	
	And request { "short_description": '#(_sd)'}
	When method patch
	Then status 200 
	And print response
	