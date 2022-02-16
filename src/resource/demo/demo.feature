Feature:processon
  Background:
    * url 'https://www.processon.com/folder/loadfiles'
#    * header 'JSESSIONID=77899733910C1D45FB4ABE715BA5A5FD.jvm1;processon_userKey=5b337131e4b045a5a3089a1e; _sid=e13e5e699351934d59e70402f1bacd75;'
  Scenario: history
    Given path ''
    And request { resource : 'history' }
    And header cookie = 'JSESSIONID=77899733910C1D45FB4ABE715BA5A5FD.jvm1'
    And header processon_userKey = '5b337131e4b045a5a3089a1e'
    And header _sid = 'JSESSIONID=e13e5e699351934d59e70402f1bacd75'
    And header Accept = '*/*'
    And header Accept-Encoding = 'gzip, deflate, br'
    And header content-type = 'application/x-www-form-urlencoded; charset=UTF-8'
    When method post
    Then status 200
    And match $[0].result == 'success'