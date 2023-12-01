require "minitest/autorun"
require_relative "../lib/01.2"

class CalibratorTest < Minitest::Test
  def setup
    @calibrator = Calibrator.new
  end

  def test_calibration_value
    assert_equal(29, @calibrator.value("two1nine"))
    assert_equal(83, @calibrator.value("eightwothree"))
    assert_equal(13, @calibrator.value("abcone2threexyz"))
    assert_equal(24, @calibrator.value("xtwone3four"))
    assert_equal(42, @calibrator.value("4nineeightseven2"))
    assert_equal(14, @calibrator.value("zoneight234"))
    assert_equal(76, @calibrator.value("7pqrstsixteen"))
    assert_equal(52, @calibrator.value("xfive79two775eightwohm"))
  end

  def test_sum_from_input
    input = %w[
      two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
    ].join("\n")
    assert_equal(281, Calibrator.new(input).sum)
  end
end
