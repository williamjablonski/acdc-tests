# 09/07/2015 - QA Trainning - SuperStars Automation
# Mirna Silva

 Feature: Basic User Authentication

 Scenario: Verify if the website is performing a login correctly
   Given that I navigate to SuperStarsHomePage
   Then I click on "Sign in" button
   And I click on "Add account" button
   Then I enter "user1acdc@avenuecode.com" into input field having id "Email" there
   And I click on "Next" button
   Then I enter "acdcuser1" into input field having id "Passwd" there
   When I click on "Log In" button
   And I wait for 10 seconds
   Then I should be logged in
