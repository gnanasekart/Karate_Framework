Feature: Data from Example

Background: Read the data for data driven
 Given def testdata = read("testdata.csv")

Scenario Outline: Fetching data from Example 

Given print '<url>'
When print '<path>'
Then print '<method>'
And print '<status>'

Examples:
| url        |  path    |method   |status|
|http://get  |/api/table|get      |200   |
|http://post |/api/table|post     |201   |

Scenario Outline: Fetching data from Example <jobId>

Given print '<jobId>'
When print '<jobTitle>'
Then print '<jobDescription>'
And print '<status>'

Examples:


	|testdata|