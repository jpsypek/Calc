class Calculator

  attr_reader :values

  def initialize(value)
    @values = [value]
  end

  def add_value(value)
    @values << value
  end

  def perform_calculation(operator)
    case operator
    when "+"
      calculated_value = @values.reduce(&:+)
    when "-"
      calculated_value = @values.reduce(&:-)
    when "*"
      calculated_value = @values.reduce(&:*)
    when "/"
      calculated_value = @values.reduce(&:/)
    end
    @values = [calculated_value]
    STDOUT.puts "= #{calculated_value}"
  end
end
