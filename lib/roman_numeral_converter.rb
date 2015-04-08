# Contains methods to convert between decimals and Roman numerals
# @author Javier L. Velasquez, <nycjv321@gmail.com>
module RomanNumeralConverter
  @@roman_numerals = {I: 1, V: 5, X: 10, L: 50, C: 100, D: 500, M: 1000}
  @@subtractive_notations = {IV: 4, IX: 9, XL: 40, XC: 90, CD: 400, CM: 900}
  @@subtractive_notation = true

  def subtractive_notation?
    @@subtractive_notation
  end

  # Convert a Roman Numeral to its decimal equivalent
  # @param roman [String] A string representing a Roman Numeral
  # @return [Integer] The converted decimal
  def to_i (roman)
    decimal = 0

    @@subtractive_notations.each do |form, value|
      if roman.include? form.to_s
        roman.gsub! form.to_s, ''
        decimal = decimal + value
      end
    end

    roman.split('').each do |char|
      decimal = decimal + @@roman_numerals[char.to_sym]
    end
    decimal
  end

  # Convert a decimal to its Roman Numeral equivalent
  # @param decimal [String] A string representing a decimal
  # @return [String] The formatted Roman Numeral string
  def to_r(decimal)
    roman_form = ''

    decimal = decimal.round if decimal.is_a? Float

    @@roman_numerals.reverse_each do |letter, number|
      while decimal / number > 0
        roman_form = roman_form + letter.to_s
        decimal = decimal - number
      end
    end
    if subtractive_notation?
      roman_form.gsub! 'VIIII', 'IX'
      roman_form.gsub! 'IIII', 'IV'
      roman_form.gsub! 'LXXXX', 'XC'
      roman_form.gsub! 'XXXX', 'XL'
      roman_form.gsub! 'DCCCC', 'CM'
      roman_form.gsub! 'CCCC', 'CD'
    end
    roman_form
  end
end
