class Racer
  def initialize(input)
    @times_input, @distances_input = input
  end

  def races
    @races ||= times.zip(distances)
  end

  private

  attr_reader :times_input, :distances_input

  def times
    extract_digits(times_input)
  end

  def distances
    extract_digits(distances_input)
  end

  def extract_digits(string)
    string.scan(/\d+/).map(&:to_i)
  end
end
