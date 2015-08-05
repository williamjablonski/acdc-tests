# 09/07/2015 - QA Training - SuperStars Automation
# Mirna Silva

 Feature: Basic User Authentication

 Scenario: Valid users should be able to access ACSuperstars application and should be on homepage after login
   Given I navigate to SuperStarsHomePage
   When I click on "Sign in" button
   Then I fill the "Email" field with valid data
   When I click on "Next" button
   Then I fill the "Passwd" field with valid data
   When I click on "Log in" button
   Then I should be on SuperStarsInitialPage

 Scenario: Invalid password should display an error message
   Given I navigate to SuperStarsHomePage
   When I click on "Sign in" button
   Then I fill the "Email" field with valid data
   When I click on "Next" button
   Then I fill the "Passwd" field with invalid data
   When I click on "Log in" button
   Then I should see an error message for invalid password

 Scenario: Invalid users should be should be routed back to the SignInPage
   Given I navigate to SuperStarsHomePage
   When I click on "Sign in" button
   Then I fill the "Email" field with invalid data
   When I click on "Next" button
   Then I should see an error message for invalid email