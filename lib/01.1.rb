class Calibrator
  attr_reader :input
  def initialize(input = nil)
    @input = input
  end

  def sum
    input.split("\n").map {|line| value(line) }.sum
  end

  def value(string)
    digits = string.scan(/\d/)
    [digits.first, digits.last].join.to_i
  end
end
