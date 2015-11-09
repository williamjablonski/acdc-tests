# 07/09/2015 - QA Training - SuperStars Automation
# Mirna Silva

 Feature: Basic User Authentication

 Scenario: Valid users should be able to access ACDC application and should be on homepage after login
   Given I navigate to ACDCHomePage
   When I click on "Sign in" button
   Then I fill the "Email" field with valid data
   When I click on "Next" button
   Then I fill the "Passwd" field with valid data
   When I click on "Log in" button
   Then I should be on ACDCInitialPage

 Scenario: Invalid password should display an error message
   Given I navigate to ACDCHomePage
   When I click on "Sign in" button
   Then I fill the "Email" field with valid data
   When I click on "Next" button
   Then I fill the "Passwd" field with invalid data
   When I click on "Log in" button
   Then I should see an error message for invalid password

 Scenario: Invalid email should display an error message
   Given I navigate to ACDCHomePage
   When I click on "Sign in" button
   Then I fill the "Email" field with invalid data
   When I click on "Next" button
   Then I should see an error message for invalid email

   @test
 Scenario: Not licensed account should be redirected to ACDC homepage
   Given I navigate to ACDCHomePage
   When I click on "Sign in" button
   Then I fill the "Email" field with not licensed data
   When I click on "Next" button
   Then I fill the "Passwd" field with not licensed data
   When I click on "Log in" button
   And I approve superstars to access my account
   Then I should be on ACDCHomePage