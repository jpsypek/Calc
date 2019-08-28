class Calculator

  attr_reader :values

  def initialize()
    @values = []
  end

  def add_value(value)
    @values << value
  end

#Checks the current stack to see if an operation can be performed. If the stack is >= 2, performs the input operation on the top two values of the stack and updates the stack with that result on top. If this results is a stack of 1, that value is output as a float or integer based on whats necessary (ex, 1.0 will be returned as 1, 1.5 will be returned as 1.5).
  def check_calculation(operator)
    if @values.length < 2
      return STDOUT.puts "Please enter another number before performing an operation:"
    else
      new_value = perform_calculation(operator, @values.pop(), @values.pop())
      @values.push(new_value)
    end
    if @values.length == 1
      value_with_correct_decimals = @values[0].to_i == @values[0] ? @values[0].to_i : @values[0]
      STDOUT.puts "= #{value_with_correct_decimals}"
    end
  end

#Performs the specified operation on the values and returns the results.
  def perform_calculation(operator, last_value, previous_value)
    calculated_value = previous_value.send(operator, last_value)
    return calculated_value
  end

end
