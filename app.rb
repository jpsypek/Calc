require_relative './Calculator.rb'

class App

  def initialize()
    @calc = Calculator.new
  end

  #Welcome message and instantiate an instance of the Calculator class
  def welcome
    STDOUT.puts "Welcome to the RPN calculator. To get started, please enter a number:"
    handle_input
  end

  #Checks if the input and if it is a number, adds the number to the stack (values). If it is an operator, calls class method check_calculation on the instance of the class to see if the calculation can be performed, and if so performs that calculation. If it is q, exits the application. Otherwise, displays a message asking for a number or operator.
  def handle_input
    input = STDIN.gets.chomp()
    if is_input_number?(input)
      @calc.add_value(input.to_f)
      handle_input
    elsif input == "q"
      exit_app
    elsif ["+", "-", "*", "/", "**"].include?(input)
      @calc.check_calculation(input)
      handle_input
    else
      handle_invalid_input
    end
  end

  #Returns a boolean describing whether the input is an interger or a float.
  def is_input_number?(input)
    input.to_i.to_s == input || input.to_f.to_s == input
  end

  #Displays correct error message based on whether the values stack has at least 2 values
  def handle_invalid_input
    STDOUT.puts @calc.values.length >= 2 ? "Please enter a number or an operator:" : "Please enter a number:"
    handle_input
  end

  #Outputs "goodbye" then exits the application.`
  def exit_app
    STDOUT.puts "goodbye"
    exit
  end
end

App.new.welcome
