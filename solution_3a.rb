file = File.open('input_3.txt').read
lines = file.split("\n")

require 'pry'

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


def calculate_sum(matrix)
  sum = 0
  matrix.each_with_index do |row, row_index|
    number_beginning = nil
    number_end = nil
    row.each_with_index do |char, char_index|
      if number_beginning == nil && integer?(char)
        number_beginning = char_index
      end
      if number_beginning && number_end == nil
        if !integer?(char)
          number_end = char_index - 1
        end
        if integer?(char) && char_index == row.length - 1
          number_end = char_index
        end
      end


      if number_beginning != nil && number_end != nil && (!integer?(char) || char_index == row.length - 1)
        if adjacent_chars(matrix, row_index, number_beginning, number_end).any? { |char| char != '.' && !integer?(char) }
          number = ''
          (number_beginning..number_end).each do |digit_index|
            number << matrix[row_index][digit_index]
          end
          number = number.to_i
          sum += number
        end

        number_beginning = nil
        number_end = nil
      end
    end
  end
  sum
end


require_relative 'tests_3a'

puts calculate_sum(MATRIX)
