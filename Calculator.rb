require 'bigdecimal'

class Calculator

  attr_reader :values

  def initialize()
    @values = []
  end

  def add_value(value)
    @values << BigDecimal(value)
  end

  #Removes the last two values in the stack and performs the specified operation on them, then adds the result to the values array.
  def perform_calculation(operator)
    last_value = values.pop()
    second_to_last_value = values.pop()
    calculated_value = second_to_last_value.public_send(operator, last_value)
    add_value(calculated_value)
  end

end
