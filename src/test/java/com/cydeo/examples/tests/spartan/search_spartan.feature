Feature: Searching Spartans

  Background:
    Given url spartan_base_url

  Scenario: Search for spartans using query params
    Given header Accept = "application/json"
    And param gender = "Female"
    And param nameContains = "A"
    And path "/spartans/search"
    When method GET
    Then status 200
    And match header Content-Type == "application/json"
    * print "total elements count = " , response.totalElement
    And match response.totalElement == 32
    * print "first name of the first person = ", response.content[0].name
    * def firstSpartanName = response.content[0].name
    And match firstSpartanName contains "a"
    And match karate.lowerCase(firstSpartanName) contains "a"
    * def allNames = $.content[*].name
    * print "all Names = " , allNames
    And match allNames   contains ["Lorenza", "Meta", "Melania"]
    * def allGenders = $.content[*].gender
    * print "gender values = " , allGenders
    And match each allGenders == "Female"

    And match each karate.lowerCase(allNames) contains "a"
