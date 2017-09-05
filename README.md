Bank Tech Test
---

This project implements an Account object with the following functionalities
 * Deposit
 * Withdraw
 * Statement

The following are out of scope
  * Implementing any kind of user interface such as command line interface, HTML forms etc.
  * Persisting data between executions such as files, databases etc.

Restrictions
  * No variables should be accessible
  * Only the statement method can return something

#### Technologies

Language - Ruby  
Testing framework - RSpec

#### Design

Account object an interface of 3 methods

  * deposit(date, amount)
    * date - string, can be in any format
    * amount - integer or float, must be positive
    * increases the balance by the amount
  * withdraw(date, amount)
    * date - string, can be in any format
    * amount - integer or float, must be positive
    * decreases the balance by the amount
  * statement
    * prints a header
    * prints each deposit and withdrawal, with most recent first

Assumptions
  * The transactions always occur in chronological order i.e. the date of a deposit or withdrawal is >= date of the last recorded transaction.
  * Account is not expected to have a negative balance i.e. it is not a current account with overdraft facility
