Feature: User get the incident details

Background: Setup baseURL
	Given url 'https://dev68166.service-now.com'
	And headers {Accept:'application/x-www-form-urlencoded'}

Scenario: User login into service
Given path '/oauth_token.do'
And form field grant_type = 'password'
And form field client_id = 'da0813b8c32620101cb8146c8dca8cca'
And form field client_secret = '0921123'
And form field username = 'admin'
And form field password = '641601@Tgs'

When method post

Then status 200
And match response == '#notnull' 
And def accesstoken = response.access_token
And print "Access token for Oauth2 = "+accesstoken
And print response