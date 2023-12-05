class Almanac
  def initialize(input)
    @input = input
  end

  def seeds
    input.first.scan(/\d+/).map(&:to_i)
  end

  private

  attr_reader :input
end
