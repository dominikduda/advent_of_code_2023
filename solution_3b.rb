file = File.open('input_3.txt').read
lines = file.split("\n")

MATRIX = lines.map { |line| line.split('') }

def integer?(string_number)
  string_number.to_i.to_s == string_number
end

def adjacent_chars(matrix, row_index, number_beginning_index, number_end_index)
  chars = []

  chars << matrix[row_index - 1][number_beginning_index - 1] if row_index > 0
  chars << matrix[row_index][number_beginning_index - 1]
  chars << matrix[row_index + 1][number_beginning_index - 1] if row_index < matrix.length - 1

  (number_beginning_index..number_end_index).each do |digit_index|
    chars << matrix[row_index - 1][digit_index] if row_index > 0
    chars << matrix[row_index + 1][digit_index] if row_index < matrix.length - 1
  end

  chars << matrix[row_index - 1][number_end_index + 1] if row_index > 0
  chars << matrix[row_index][number_end_index + 1]
  chars << matrix[row_index + 1][number_end_index + 1] if row_index < matrix.length - 1

  chars.compact
end

def part_numbers_digit_coords(matrix)
  coords = []
  matrix.each_with_index do |row, row_index|
    number_beginning = nil
    number_end = nil
    row.each_with_index do |char, char_index|
      number_beginning = char_index if number_beginning.nil? && integer?(char)
      if number_beginning && number_end.nil?
        number_end = char_index - 1 unless integer?(char)
        number_end = char_index if integer?(char) && char_index == row.length - 1
      end

      next unless !number_beginning.nil? && !number_end.nil? && (!integer?(char) || char_index == row.length - 1)

      if adjacent_chars(matrix, row_index, number_beginning, number_end)
         .any? { |char| char != '.' && !integer?(char) }
        number_digits_coords = []
        (number_beginning..number_end).each do |digit_index|
          number_digits_coords << [row_index, digit_index]
        end
        coords << number_digits_coords
      end

      number_beginning = nil
      number_end = nil
    end
  end
  coords
end

def adjacent_coords(x, y)
  [
    [x - 1, y + 1],
    [x, y + 1],
    [x + 1, y + 1],
    [x + 1, y],
    [x + 1, y - 1],
    [x, y - 1],
    [x - 1, y - 1],
    [x - 1, y]
  ]
end


def part_number?(part_coords, x, y)
  part_coords.each do |digits_coords|
    return true if digits_coords.any? { |part_x, part_y| part_x == x && part_y == y }
  end
  false
end

def get_all_part_coords(part_coords, x, y)
  part_coords.each do |digits_coords|
    return digits_coords if digits_coords.any? { |part_x, part_y| part_x == x && part_y == y }
  end
  nil
end

def to_integer(part_coords, digits_coords)
  number = ''
  digits_coords.each do |x, y|
    number << MATRIX[x][y]
  end
  number.to_i
end

part_coords = part_numbers_digit_coords(MATRIX)

part_digits_coords_making_a_gear = []
MATRIX.each_with_index do |row, row_index|
  row.each_with_index do |char, char_index|
    next unless char == '*'

    adjacent_part_coords = []
    adjacent_coords(row_index, char_index).each do |x, y|
      if part_number?(part_coords, x, y)
        adjacent_part_coords << get_all_part_coords(part_coords, x, y)
      end
    end
    part_digits_coords_making_a_gear << adjacent_part_coords.uniq unless adjacent_part_coords.empty?
  end
end

sum = 0
part_digits_coords_making_a_gear.each do |gear_parts_coords|
  numbers = []
  gear_parts_coords.each do |gear_part_coords_sets|
    numbers << to_integer(part_coords, gear_part_coords_sets)
  end
  next if numbers.length != 2
  sum += numbers.reduce(&:*)
end

puts sum
