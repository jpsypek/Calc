require_relative './RPN.rb'

#Welcome message and invokes first_value
def welcome
  STDOUT.puts "Welcome to the RPN calculator. To get started, please enter a number:"
  first_value
end

#Calculator class must be initiated with a number value, so checks to make sure first input is either a number or "q" to exit the program, otherwise displays an error
def first_value
  input = STDIN.gets.chomp()
  if input.to_i.to_s == input || input.to_f.to_s == input
    $calc = Calculator.new(input.to_f)
    values_after_initialized
  elsif input == "q"
    exit_app
  else
    STDOUT.puts "Please enter a number"
    first_value
  end
end

def values_after_initialized
  input = STDIN.gets.chomp()
  if input.to_i.to_s == input || input.to_f.to_s == input
    $calc.add_value(input.to_f)
    values_after_initialized
  elsif input == "q"
    exit_app
  elsif input == "+" || input == "-" || input == "*" || input == "/" || input == "**"
    $calc.check_calculation(input)
    values_after_initialized
  else
    STDOUT.puts "Please enter a number or an operator:"
    values_after_initialized
  end
end

def exit_app
  STDOUT.puts "goodbye"
  exit
end

welcome
