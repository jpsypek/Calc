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

  private

  #Checks if the input and if it is a number, adds the number to the stack (values). If it is an operator, calls class method check_calculation on the instance of the class to see if the calculation can be performed, and if so performs that calculation. If it is q, exits the application. Otherwise, displays a message asking for a number or operator.
  def handle_input
    input = STDIN.gets.chomp()

    if input_is_number?(input)
      @calc.add_value(input)
      handle_input
    elsif input_is_operator?(input)
      handle_operator_input(input)
    elsif input == "q"
      exit_app
    else
      handle_invalid_input
    end

  end

  #Checks the values stack to see if an operation can be performed. If the stack is >= 2, performs the input operation on the top two values of the stack and updates the stack with that result on top (replacing the previous two values). If this results in a stack of 1, that value is output as a float or integer based on whats necessary (ex, 1.0 will be returned as 1, 1.5 will be returned as 1.5).
  def handle_operator_input(operator)

    if @calc.values.length < 2
      STDOUT.puts "There must be at least 2 numbers in the stack to perform an operation. Please enter a number:"
      handle_input
    else
      @calc.perform_calculation(operator)
    end

    if @calc.values.length == 1
      value_with_correct_decimals = @calc.values[0].to_i == @calc.values[0] ? @calc.values[0].to_i : @calc.values[0].to_f
      STDOUT.puts "= #{value_with_correct_decimals}"
    end

    handle_input
  end

  #Returns a boolean describing whether the input is an interger or a float.
  def input_is_number?(input)
    input.to_i.to_s == input || input.to_f.to_s == input
  end

  #Returns a boolean describing whether the input is an operator.
  def input_is_operator?(input)
    ["+", "-", "*", "/", "**"].include?(input)
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
