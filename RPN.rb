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
    elsif @values.length == 2
      new_value = perform_calculation(operator, @values[1], @values[0])
      @values = [new_value]
      return STDOUT.puts "= #{@values[0]}"
    else
      new_value = perform_calculation(operator, @values.pop(), @values.pop())
      @values.push(new_value)
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
