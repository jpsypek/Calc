require_relative './RPN.rb'

#Welcome message and invokes first_value
def welcome
  STDOUT.puts "Welcome to the RPN calculator. To get started, please enter a number:"
  first_value
end

#Calculator class must be initiated with a number value, so checks to make sure first input is either a number or "q" to exit the program, otherwise displays an error.
def first_value
  input = STDIN.gets.chomp()
  if is_input_number?(input)
    $calc = Calculator.new(input.to_f)
    values_after_initialized
  elsif input == "q"
    exit_app
  else
    STDOUT.puts "Please enter a number:"
    first_value
  end
end

#Checks if the input and if it is a number, adds the number to the stack (values). If it is an operator, calls class method check_calculation on the instance of the class to see if the calculation can be performed, and if so performs that calculation. If it is q, exits the application. Otherwise, displays a message asking for a number or operation.
def values_after_initialized
  input = STDIN.gets.chomp()
  if is_input_number?(input)
    $calc.add_value(input.to_f)
    values_after_initialized
  elsif input == "q"
    exit_app
  elsif ["+", "-", "*", "/", "**"].include?(input)
    $calc.check_calculation(input)
    values_after_initialized
  elsif $calc.values.length < 2
    STDOUT.puts "Please enter a number:"
    values_after_initialized
  else
    STDOUT.puts "Please enter a number or an operator:"
    values_after_initialized
  end
end

#Returns a boolean describing whether the input is an interger or a float.
def is_input_number?(input)
  input.to_i.to_s == input || input.to_f.to_s == input
end

#Outputs "goodbye" then exits the application.`
def exit_app
  STDOUT.puts "goodbye"
  exit
end

welcome
