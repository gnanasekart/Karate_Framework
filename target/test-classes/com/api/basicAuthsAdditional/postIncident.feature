Feature: User get the incident details 

Background: Setup baseURL 
	Given url _url 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
	
Scenario: User create new instance in table using request 
	Given path _path
	And def ranvalue = function() {return Math.floor((100) * Math.random()); } 
	And request 
		"""
	{
"short_description":"Test incident creation through REST",
"comments":"These are my comments",
"description": "this text from data sheet",
"state": '#(ranvalue())',
"category": "software",
"contact_type": "email",
"caller_id": '#(_callerid)',
"assigned_to": '#(_assignto)',
"work_notes": "home work",
"comments_and_work_notes": "Solved (Permanently)"  
}
	
	"""
	When method post 
	Then status 201 
	And print response 
	And match response == '#notnull' 
	And match response.result.assigned_to.value == "myself" 
	
	
Scenario: User create new instance in table using request body
	Given path _path 
	And def body = read("classpath:com/api/basicAuths/data/signup.json") 
	And request body 
	When method post 
	Then status 201 
	And print response 
	And match response == '#notnull' 
	And match response.result.category == "software" 
