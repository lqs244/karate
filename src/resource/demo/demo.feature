Feature:processon
  Background:
    * url 'https://www.processon.com'
  Scenario: history
    Given path '/folder/loadfiles'
    And request { resource : 'history' }
    And header cookie = 'JSESSIONID=86F4DACFA43E4B3620B823641E883F57.jvm1'
    And header Host = 'www.processon.com'
    When method post
    Then status 200
    And match $.result == 'success'