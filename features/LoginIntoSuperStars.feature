# 09/07/2015 - QA Trainning - SuperStars Automation
# Mirna Silva

 Feature: Verify if the website is performing a login correctly

 Scenario: Verify if the website is performing a login correctly
   Given that I navigate to the website
   And I click on "Sign in" button
   Then I click on "Add account" button
   And I enter "msilva@avenuecode.com" into input field having id "Email"
   And I click on "Next" button
   And I enter "mps@1389" into input field having id "Passwd"
   When I click on "Log In" button
   And I wait for 10 sec
   Then I should be logged in