class Race
  attr_reader :time, :record

  def initialize(time:, record:)
    @time = time
    @record = record
  end

  def number_of_wins
    distances.select {|distance| distance > record }.count
  end

  def hold(ms)
    distance = (time - ms) * ms
  end

  def distances
    (0..time).map {|speed| hold(speed) }
  end
end

class Racer
  def initialize(input)
    @times_input, @distances_input = input
  end

  def races
    @races ||= times.zip(distances).map do |time, record|
      Race.new(time:, record:)
    end
  end

  def number_of_wins_per_race
    races.map(&:number_of_wins)
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
