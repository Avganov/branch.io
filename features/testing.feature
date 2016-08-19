Feature: LogIn
@reset_password


  Scenario: LogIn
    Then I LogIn Branch
    Then I Click on Sign In link
    Then I Click on Forgot Password

    Then I Enter email address
    Then I Click on Continue button
    Then I check Gmail account
