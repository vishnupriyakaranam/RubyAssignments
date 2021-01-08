Feature: Sample Feature

  Scenario Outline: Sample Scenario
    Given Navigate to Gmail
    When Logged in using username as "<username>" and password as "<password>"
    Then Compose mail and save as draft
    And Validate mail under Drafts
    Then Compose mail and self send
    And Validate sent mail
    Then Star the mail under Inbox
    And Validate mail under Starred

    Examples:
      | username            | password       |
      | test52526@gmail.com | pass@test52526 |