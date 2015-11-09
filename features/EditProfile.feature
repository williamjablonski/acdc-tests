# 06/11/2015 - QA Team - ACDC Automation
# William Melchior Jablonski

Feature: User must be able to edit his/her profile

  Scenario: Verify if the user is accessing the website for the first time
    Given I navigate to ACDCHomePage
    When I sign-in into the website
    Then I should see the Complete Profile pop-up

  Scenario: Verify if the username filter is presenting results
    Given I navigate to ACDCHomePage
    When I sign-in into the website
    Then I should see "A/Z" on menu bar
    When I hover A/Z button
    And I click on "M" button
    Then I should see users that starts with chosen letter