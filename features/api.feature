Feature: API

@pending
Scenario Outline: Remove all items from Known User bag
Given I sign in via API as a <user_type> user
Then the user bag is emptied

Examples:
|user_type  |
|known      |