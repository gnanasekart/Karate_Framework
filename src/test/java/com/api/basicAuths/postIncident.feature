@full
Feature: User get the incident details 

Background: Setup baseURL 
	Given url 'https://dev68166.service-now.com' 
	And headers {Accept:'application/json', Authorization:'Basic YWRtaW46NjQxNjAxQFRncw=='} 
@smoke	
Scenario: User login into service 
	Given path '/api/now/v1/table/incident' 
	And def ranvalue = function() {return Math.floor((100) * Math.random()); } 
	And request { "short_description":"Test incident creation through REST", "comments":"These are my comments", "description": "this text from data sheet", "state": '#(ranvalue())', "category": "software", "contact_type": "email", "caller_id": "sekar", "assigned_to": "gopi", "work_notes": "home work", "comments_and_work_notes": "Solved (Permanently)"} 
	When method post 
	Then status 201 
	And print response 
	And match response == '#notnull' 
	And match response.result.category == "software" 
	
@Regression
Scenario: User login into service 
	Given path '/api/now/v1/table/incident' 
	And def body = read("data/signup.json") 
	And request body 
	When method post 
	Then status 201 
	And print response 
	And match response == '#notnull' 
	And match response.result.category == "software" 
