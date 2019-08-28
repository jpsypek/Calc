class Calculator

  def initialize(value)
    @values = [value]
  end

  def add_value(value)
    @values << value
  end

  def check_calculation(operator)
    if @values.length < 2
      return STDOUT.puts "Please enter a number:"
    else @values.length >= 2
      new_value = perform_calculation(operator, @values.pop(), @values.pop())
      @values.push(new_value)
    # else
    #   new_value = perform_calculation(operator, @values.pop(), @values.pop())
    #   @values.push(new_value)
    end
    if @values.length == 1
      STDOUT.puts "= #{@values[0]}"
    end
  end

  def perform_calculation(operator, last_value, previous_value)
    case operator
    when "+"
      calculated_value = previous_value + last_value
    when "-"
      calculated_value = previous_value - last_value
    when "*"
      calculated_value = previous_value * last_value
    when "/"
      calculated_value = previous_value / last_value
    when "**"
      calculated_value = previous_value ** last_value
    end
    return calculated_value.to_i == calculated_value ? calculated_value.to_i : calculated_value
  end

end
