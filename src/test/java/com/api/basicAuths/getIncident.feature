Feature: User get the incident details 

Background: Setup baseURL 
	Given url 'https://dev68166.service-now.com' 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
@Smoke @full
Scenario: User login into service 
	Given path '/api/now/v1/table/incident' 
	And param sysparm_fields = 'number, sys_id, priority, short_description, sys_class_name' 
	When method get 
	Then status 200 
	#And print response
	And print response.result[0] 
	And def sysid = response.result[0].sys_id
	And match response == '#notnull' 
	And def length = response.result.length 
	#And print "sysid = ", sysid
	#And print 'length is - ' +length 
	
	#fuzzy matcher
	And match response.result == '#array' 
	And match response.result[0].number == '#string' 
	And match response.result[0].sys_id == '#string' 
	And match response.result[0].short_description == '#string' 
	And match response.result[0].priority == '#string' 
	And match response.result[0].sys_class_name == '#string' 
	
	#complex fuzzy matcher
	And match response.result[0].priority == '#? _ == 3' 
	And match response.result[0].short_description == '#string? _.length >= 1' 
	
	#To validate the array
	And match response.result == '#[]' 
	And match response == 
		"""
{
    "result": #[] '#object'
}
"""
		#And match response.result == '#[67]'
		
		#Array of string
		#And match response.result == '#[67] #string'
		#And match response.result == '#[] #string? _.length >=2'
		
		# should be null or an array of strings
		#And match response.result == '##[] #string'