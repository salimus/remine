@all
Feature: Tests for Home screen functionality

  @home
  Scenario: Check UI in Home screen
    Given I land on Home screen
    Then I check Logo and "Are you an agent?" question
    And I check the existence of "YES" and "NO" buttons

  @agent_login
  Scenario: Login to the app as an Agent
    Given I land on Home screen
    When I click on "YES" button
    Then I will navigate to the Agent screen
    And I will enter "mymlsemail@gmail.com" as MLS email
    And I will enter "1234567" as Agent ID
    Then I click on "FIND ME" button
    And I should navigate to my profile page

  @non_agent_login
  Scenario: Login to the app as non-Agent
    Given I land on Home screen
    When I click on "NO" button
    Then I will navigate to the Log In screen
    And I will enter "mymlsemail@gmail.com" as email
    And I will enter "password123" as password
    Then I click on "LOG IN" button
    And I should navigate to my profile page

  @sign_up_for_non_agent
  Scenario: Test sign up form for non-Agent
    Given I land on Home screen
    When I click on "NO" button
    Then I will navigate to the Log In screen
    Then I click on "SIGN UP" button
    And I should navigate to "Sign Up" page
    Then I will type my name "Salim" in name field
    And I will type "myemail@gmail.com" as email
    And I will type "password123" as password
    And I will type my phone number "6505554433"
    Then I mark checkbox to accept terms
    And I click on "NEXT" button
    Then I should navigate to Enter Referral Code page

  @negative_invalid_email
  Scenario: Test an MLS email format in Agent screen by entering invalid email format
    Given I land on Home screen
    When I click on "YES" button
    Then I will navigate to the Agent screen
    And I will enter "mymlsemail" as MLS email
    And I will enter "1234567" as Agent ID
    Then I click on "FIND ME" button
    And I should see an error message "Please type a valid email address."