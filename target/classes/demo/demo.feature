Feature:processon
  Background:
    * url 'https://www.processon.com'

    * configure proxy = 'http://127.0.0.1:8888'
    * configure ssl = { trustAll: True }

    * def map = Java.type('tesat1.tool')
    * def my_map = new map()
    #1如何在两个Scenario之间通用数据，上一个S的数据如何使用在下一个S
  #2如何调用java代码
  Scenario: login
    Given path '/login/quick_login'
#    And request {type: account_login,login_email: 2445384234@qq.com, login_password: 1373113aaa}
    And form fields { type: 'account_login', login_email: '2445384234@qq.com', login_password: '1373113aaa'}
    When method post
    Then status 200
    And match $.result == 'success'
    * def a = my_map.__set('login_cookies',responseCookies)
  Scenario: history
    * def mycookie = my_map.__get('login_cookies')
    Given path '/folder/loadfiles'
    And request { resource : 'history' }
#    And cookies mycookie
    And cookie JSESSIONID = 'DB57A05C8C9764ED7BE9A361BF93B958.jvm1'
    When method post
    Then status 200
    And match $.result == 'success'
    And match $.charts[0] contains {title: '未命名文件'}
