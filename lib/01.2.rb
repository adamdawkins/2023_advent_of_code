class Calibrator
  attr_reader :input
  WORDS_TO_DIGITS = { "one"   => "1",
                      "two"   => "2",
                      "three" => "3",
                      "four"  => "4",
                      "five"  => "5",
                      "six"   => "6", 
                      "seven" => "7",
                      "eight" => "8",
                      "nine"  => "9" }.freeze

  def initialize(input = nil)
    @input = input
  end

  def sum
    input.split("\n").map {|line| value(line) }.sum
  end

  def value(string)
    digits = string.scan(/(\d|one|two|three|four|five|six|seven|eight|nine|ten)/)
    [digits.first, digits.last].flatten.map {|word| word_to_digit(word) }.join.to_i

  end

  private

  def word_to_digit(word)
    WORDS_TO_DIGITS[word] || word    
  end
end
