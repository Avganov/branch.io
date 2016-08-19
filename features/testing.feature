Feature: LogIn
@reset_password


  Scenario: LogIn
    Then I LogIn Branch
    Then I Click on Sign In link
    Then I Click on Forgot Password

    Then I Enter my Gmail Account
    Then Click on Continue button
    Then
