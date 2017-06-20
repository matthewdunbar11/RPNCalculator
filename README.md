CLI RPN Calculator
===================

Description
-------------------
This repository hosts a CLI for a Reverse Polish Notation calculator. Numbers and operators (+, -, *, /) can be entered either on separate lines or separated by spaces.

Design Decisions
-------------------
The RPN specific logic was abstracted to a RPNCalculator class so input parsing and logic wouldn't have to be done in the client code. A separate class also will allow new operators to be added without changing existing code. 
I could have used two separate methods on the calculator, one for numbers and one for operators, but I decided against that so the RPNCalculator would be allowed to decide what is an operator and what is a number. 

Trade-Offs
-------------------
One trade-off made is using exceptions for determining if the input is a number. I used REGEX at first but decided against rewriting functionality that comes built in Ruby. Exceptions aren't best used for program flow, but it made sense in this instance. Given more time, I would look into better ways to determine if a string is a number, potentially abstracting the check away into a separate method. I will also separate the Input method out into smaller, easier to test methods once it grows.

Testing
-------------------
Tests are written using the RSpec gem. Run `bundle install` to install rspec. Tests can be run using the `rspec` command from the root of the project.

Running
-------------------
Run the calculator by running `ruby program.rb`