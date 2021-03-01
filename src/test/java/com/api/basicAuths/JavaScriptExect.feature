@Regression @Smoke @full
Feature: To Execute the JS function

Scenario: Execute JS function
Given def getInt = function() {return 10; }
Then print "function value = ", getInt()
And def getRandom = function() {return Math.floor((100) * Math.random()); }
Then print "function value = ", getRandom()
And def getString = function() {return "Hello "+arg1; }
Then print "function value = ", getString("hello")