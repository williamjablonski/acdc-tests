# 08/10/2015 - QA Training - SuperStars Automation
# Mirna Silva

Feature: User must be able to edit his/her profile

  Scenario: Verify if the user is accessing the website for the first time
    Given I navigate to SuperStarsHomePage
    When I sign-in into the website
    Then I should see the Complete Profile pop-up

  Scenario: Verify if the username filter is presenting results
    Given I navigate to SuperStarsHomePage
    When I sign-in into the website
    Then I should see "A/Z" on menu bar
    When I hover A/Z button
    And I click on "M" button
    Then I should see users that starts with chosen letter