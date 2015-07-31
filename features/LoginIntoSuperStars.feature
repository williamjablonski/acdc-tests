# 09/07/2015 - QA Trainning - SuperStars Automation
# Mirna Silva

 Feature: Basic User Authentication

 Scenario: Valid users should be able to access ACSuperstars application and should be on homepage after login
   Given I navigate to SuperStarsHomePage
   Then I click on "Sign in" button
   And I click on "Add account" button
   Then I fill the "Email" field with valid data
   And I click on "Next" button
   Then I fill the "Passwd" field with valid data
   When I click on "Log In" button
   #Then I approve superstars to access my account
   #When I navigate to SuperStarsInitialPage
   Then I should be on SuperStarsInitialPage

 Scenario: Invalid users should be should be routed back to the SignInPage
   Given I navigate to SuperStarsHomePage
   Then I click on "Sign in" button
   And I click on "Add account" button
   Then I fill the "Email" field with invalid data
   And I click on "Next" button
   Then I fill the "Passwd" field with invalid data
   When I click on "Log In" button
   Then I should be on SuperStarsHomePage


