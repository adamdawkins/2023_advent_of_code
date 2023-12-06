class Map
  def initialize(input)
    @input = input
  end

  def name
    input.first.match(/([\w|-]*) map:/)[1]
  end

  private

  attr_reader :input
end

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
