
# Aşağıdaki komut ile robot çalıştırılır.(browser ve mail parametreleri girilmelidir.)  #https://www.mohmal.com/tr  den mail üretilirek email üretilebilir.
# -v Browser:Chrome -v email:qvhszeds@sharklasers.com -d Results  proje.robot
# (Chrome ve Firefox için parametrik olarak geliştirildi.)
# (-d Results parametresi robot raporlarının export edileceği dosyadır.)
*** Settings ***
Resource  ./Resources/conf.robot
Library  SeleniumLibrary
Library  DebugLibrary

*** Test Cases ***
New Member Registration
    Given Open Automationpractice website
    And click to signin
    And verify the login screen
    And enter your email address
    And click to create an account
    And enter in member informations
    When Click to register
    Then Verify Successful Registration

Creating an Order
   Given Open The Summer Dresses page
    And verify the summer dresses screen
    And adding products & verification
    And Address Selection
    And Shipping Selection
    And Payment Selection
    When Click I confirm my order the button
    Then Verify Successful Order & Details