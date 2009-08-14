Feature: Manage Photos
  In order to make an album
  As a user
  I want to create and manage photos

  Scenario: Photos List
    Given I have photos titled pro, foo
    When I go to the list of photos
    Then I should see "pro"
    And I should see "foo"
  