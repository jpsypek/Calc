require_relative './RPN.rb'

def welcome
  STDOUT.puts "Welcome to the RPN calculator. To get started, please enter a number:"
  first_value
end

def first_value
  input = STDIN.gets.chomp()
  if input.to_i.to_s == input
    $calc = Calculator.new(input.to_i)
    values_after_initialized
  elsif input == "q"
    STDOUT.puts "goodbye"
    exit
  else
    STDOUT.puts "Please enter a number"
    first_value
  end
end

def values_after_initialized
  input = STDIN.gets.chomp()
  if input.to_i.to_s == input
    $calc.add_value(input.to_i)
    values_after_initialized
  elsif input == "q"
    STDOUT.puts "goodbye"
    exit
  elsif input == "+" || input == "-" || input == "*" || input == "/"
    $calc.perform_calculation(input)
    values_after_initialized
  else
    STDOUT.puts "Please enter a number or an operator:"
    values_after_initialized
  end
end


welcome
