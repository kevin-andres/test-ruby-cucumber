Feature: Register/Create Account on NEJM.org

  Scenario: Create an Account
  Given NEJM homepage is open
  And user is not signed in
  When I create an account with following details
    |email|password|first_name|last_name|country|professional_category|speciality|place_of_work_or_study|
    |QAIT+[TIMESTAMP]@gmail.com|password|QAIT-[TIMESTAMP]|TA-QAIT|United Kingdom|Physician|Cardiology|Hospital, Community|


