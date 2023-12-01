class Calibrator
  def value(string)
    digits = string.scan(/\d/)
    [digits.first, digits.last].join.to_i
  end
end
