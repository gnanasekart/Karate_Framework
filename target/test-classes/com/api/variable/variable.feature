Feature: For Variables 

Background: Create and Initialize variables 
	Given def app_name = "fb" 
	And def page_load_time = 3 
	
Scenario: To create variable and it scope inside scenario level 
	Given def var_i = 10 
	# this variable scope inside scenario level only
	And def var_string = "gnana" 
	Then print 'Int variable = '+var_i 
	And print 'app name is = '+app_name


