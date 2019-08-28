# RPN Calculator

The RPN Calculator is a CLI application that performs calculations based on the [Reverse Polish Notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation).

## INSTRUCTIONS

* Fork and clone this repository
* In the repository's directory, run `$ ruby app.rb`
* Get started by entering at least two numbers followed by an operator (+, -, \*, or /).
There must be at least two numbers in the stack to perform an operation. If the operation results in a stack of one number, that number will be output.
* You may exit the application at any time by entering "q"

### COMMENTS
The app.rb file acts as the runner file and handles the flow as the user interacts with the application, and instantiates an instance of the Calculator class (in RPN.rb) and invokes class methods to handle the logic and calculations. My goal for this application was to follow the DRY principle and keep the code clean, efficient, and easy to follow.
