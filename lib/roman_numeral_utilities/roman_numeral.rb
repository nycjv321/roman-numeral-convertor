require_relative 'roman_numeral_converter'
require 'benchmark'

class RomanNumeral
  include RomanNumeralConverter
  attr :value

  def initialize value
    if value.is_a? Integer
      @value = value
    else
      @value = to_d value
    end
  end

  def add(y)
    if y.is_a? Integer
      to_r(@value + y)
    else
      to_r(@value + to_d(y))
    end
  end

  def add!(y)
    value = add(y)
    @value = to_d(value)
    value
  end

  def subtract(y)
    if y.is_a? Integer
      to_r(@value - y)
    else
      to_r(@value - to_d(y))
    end
  end

  def subtract!(y)
    value = subtract(y)
    @value = to_d(value)
    value
  end

  def divide(y)
    if y.is_a? Integer
      to_r(@value / y)
    else
      to_r(@value / to_d(y))
    end
  end

  def divide!(y)
    value = divide(y)
    @value = to_d(value)
    value
  end

  def multiply(y)
    if y.is_a? Integer
      to_r(@value * y)
    else
      to_r(@value * to_d(y))
    end
  end

  def multiply!(y)
    value = multiply(y)
    @value = to_d(value)
    value
  end

  def to_s
    to_r @value
  end

  def to_i
    @value
  end

  alias_method :+, :add
  alias_method :-, :subtract
  alias_method :*, :multiply
  alias_method :/, :divide

end

roman_numeral = RomanNumeral.new(1990)
p roman_numeral / 1990
p roman_numeral + 24

p roman_numeral + "I"
