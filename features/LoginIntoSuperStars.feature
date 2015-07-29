# 09/07/2015 - QA Trainning - SuperStars Automation
# Mirna Silva

 Feature: Basic User Authentication

 Scenario: Verify if the website is performing a login correctly
   Given I navigate to SuperStarsHomePage
   Then I click on "Sign in" button
   And I click on "Add account" button
   Then I fill the "Email" field
   And I click on "Next" button
   Then I fill the "Passwd" field
   When I click on "Log In" button
   Then I approve superstars to access my account
   When I navigate to SuperStarsInitialPage
   And I wait for 10 seconds
   Then I should be logged in
