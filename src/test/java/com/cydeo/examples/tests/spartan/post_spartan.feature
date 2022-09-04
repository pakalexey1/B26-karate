Feature: Add new spartan

  Background:
    * url spartan_base_url

  Scenario: Adding a new spartan to the DB
    Given header Content-Type = "application/json"
    And header Accept = "application/json"
#    set json body request
    And request {name: "karate", gender : "Male", phone : 1231231234}
    And path "/spartans"
    When method POST
    Then status 201
    And match response.data.id == '#number'
    * def successMsg = response.success
    * print "message = " , successMsg
    And assert successMsg == "A Spartan is Born!"
    And assert response.data.name == "karate"
    * def newSpartanId = response.data.id
    * print "New spartan id is: " , newSpartanId

#      Send GET request to /spartans/newSpartanId
    Given header Accept = "application/json"
    And path "/spartans" , newSpartanId
    When method GET
    Then status 200
    And match response == {id: '#(newSpartanId)' , name : "karate", gender : "Male", phone : 1231231234}

#    delete newly created spartan using newSpartanId
    Given path "/spartans", newSpartanId
    When method DELETE
    Then status 204