require "minitest/autorun"
require_relative "../lib/01.1"

class CalibratorTest < Minitest::Test
  def setup
    @calibrator = Calibrator.new
  end

  def test_calibration_value
    assert_equal(12, @calibrator.value("1abc2"))
    assert_equal(38, @calibrator.value("pqr3stu8vwx"))
    assert_equal(15, @calibrator.value("a1b2c3d4e5f"))
    assert_equal(77, @calibrator.value("treb7uchet"))
  end

  end
end
