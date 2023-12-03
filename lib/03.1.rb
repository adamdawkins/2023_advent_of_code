class Number
  attr_reader :value, :y, :min_x, :max_x
  def initialize(value:, y:, xs:)
    @value = value
    @y = y
    @min_x, @max_x = xs
  end

  def coordinates
    [[y, min_x], [y, max_x]]
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

    result - coordinates
  end
end

class EngineSchematic
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def numbers
    result = []
    input.each_with_index do |row, y|
      result << NumbersFromRow.new(row, y).numbers_from_row
    end
    result.flatten.compact
  end

  def sum; end
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
    Number.new(value: value.to_i, y:, xs: [min_x, max_x])
  end

  def add_to_current_number(char, x)
    self.min_x = x if value.empty?
    self.value += char
    self.max_x = x
  end
end
