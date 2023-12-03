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
      result << numbers_from_row(row, y)
    end
    result.flatten.compact
  end

  def sum; end
  

  private 

  def numbers_from_row(row, y)
    NumbersFromRow.new(row, y).numbers_from_row
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
  end

  def numbers_from_row
    result = []
    row.chars.each_with_index do |char, x|
      if char.match?(/\d/)
        self.min_x = x if value.empty?
        self.value += char
        self.max_x = x
      else
        next if value.empty?
        result << Number.new(value: value.to_i, y:, xs: [min_x, max_x])
        self.value = ""
        self.min_x = nil
        self.max_x = nil
      end
    end

    result
  end


  attr_accessor :value, :min_x, :max_x
end
