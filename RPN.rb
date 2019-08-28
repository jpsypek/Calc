class Calculator

  def initialize(value)
    @values = [value]
  end

  def add_value(value)
    @values << value
  end

#Checks the current stack to see if an operation can be performed. If the stack is >= 2, performs the input operation on the top two values of the stack and updates the stack with that result on top. If this results is a stack of 1, that value is output.
  def check_calculation(operator)
    if @values.length < 2
      return STDOUT.puts "Please enter a number:"
    else @values.length >= 2
      new_value = perform_calculation(operator, @values.pop(), @values.pop())
      @values.push(new_value)
    end
    if @values.length == 1
      STDOUT.puts "= #{@values[0]}"
    end
  end

#Performs the specified operation on the values. Returns the result as a float or integer based on whats necessary (ex, 1.0 will be returned as 1, 1.5 will be returned as 1.5)
  def perform_calculation(operator, last_value, previous_value)
    calculated_value = previous_value.send(operator, last_value)
    return calculated_value.to_i == calculated_value ? calculated_value.to_i : calculated_value
  end

end
