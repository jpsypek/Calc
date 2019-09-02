require 'bigdecimal'

class Calculator

  attr_reader :values

  def initialize()
    @values = []
  end

  def add_value(value)
    @values << BigDecimal(value)
  end

  #Performs the specified operation on the values and adds the result to the values array.
  def perform_calculation(operator, last_value, previous_value)
    calculated_value = previous_value.send(operator, last_value)
    add_value(calculated_value)
  end

end
