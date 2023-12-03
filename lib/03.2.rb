class EnginePart
  attr_reader :value, :y, :min_x, :max_x
  def initialize(value:, y:, xs:)
    @value = value
    @y = y
    @min_x, @max_x = xs
  end

  def coordinates
    (min_x..max_x).map do |x|
      [y, x]
    end
  end

  def adjacent_coordinates
    result = []
    ys = [y - 1,
          y,
          y + 1]
    xs = ((min_x - 1)..(max_x + 1)).to_a
    
    ys.each do |y|
      xs.each do |x|
        result << [y, x]
      end
    end

    (result - coordinates).select {|y, x| !y.negative? && !x.negative? }
  end

  def to_s
    "#{value.to_s.rjust(3, " ")}: (#{y.to_s.rjust(3, " ")},#{min_x.to_s.rjust(3, " ")})"
  end
end

class EngineSchematic
  attr_reader :input, :max_y, :max_x

  def initialize(input)
    @input = input
    @max_y = input.length
    @max_x = input.first.length
  end

  def numbers
    result = []
    input.each_with_index do |row, y|
      result << NumbersFromRow.new(row, y).numbers_from_row
    end
    result.flatten.compact
  end

  def symbol_at?(coordinate)
    y, x = coordinate
    !input[y][x].match?(/\d|\./)
  end

  def sum
    part_numbers.sum(&:value)
  end

  def part_number?(number)
    # reject adjacents below the bottom of the input or beyond the far right edge
    number.adjacent_coordinates.select {|y,x| y < max_y && x < max_x}
      .map {|c| symbol_at?(c) }.any?
  end

  def part_numbers
    numbers.select {|n| part_number?(n) }
  end
end

class NumbersFromRow
  attr_reader :row, :y
  def initialize(row, y)
    @row = row
    @y = y
    @min_x = nil
    @max_x = nil
    @value = ""
    @result = []
  end

  def numbers_from_row
    row.chars.each_with_index do |char, x|
      if char.match?(/\d/)
        add_to_current_number(char, x)
      else
        save_number
      end
    end
    save_number

    self.result
  end

  private

  attr_accessor :value, :min_x, :max_x, :result

  def reset_number
    self.value = ""
    self.min_x = nil
    self.max_x = nil
  end

  def save_number
    self.result << number unless value.empty?
    reset_number
  end

  def number
    EnginePart.new(value: value.to_i, y:, xs: [min_x, max_x])
  end

  def add_to_current_number(char, x)
    self.min_x = x if value.empty?
    self.value += char
    self.max_x = x
  end
end
