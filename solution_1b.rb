file = File.open('input_1.txt').read
lines = file.split("\n")
lines_2 = file.split("\n")

NUMBERS = %w[one two three four five six seven eight nine]

lines.each do |line|
  earliest_string_number = ''
  min_index = Float::INFINITY
  NUMBERS.each do |number|
    num_index = line.index(number)
    if num_index && num_index < min_index
      min_index = num_index
      earliest_string_number = number
    end
  end
  unless earliest_string_number.empty?
    line.sub!(earliest_string_number,
              (NUMBERS.index(earliest_string_number) + 1).to_s)
  end
end

lines_2.each do |line|
  latest_string_number = ''
  max_index = -1
  NUMBERS.each do |number|
    num_index = line.rindex(number)
    if num_index && num_index > max_index
      max_index = num_index
      latest_string_number = number
    end
  end
  new_line = line.reverse
  unless latest_string_number.empty?
    new_line.sub!(latest_string_number.reverse,
                  (NUMBERS.index(latest_string_number) + 1).to_s)
  end
  lines_2[lines_2.index(line)] = new_line.reverse
end

def integer?(string_number)
  string_number.to_i.to_s == string_number
end

sum = 0

cords_list = []
lines.each_with_index do |line, index|
  chars_array = line.split('')
  line_coord = ''
  chars_array.each do |char|
    if integer?(char)
      line_coord += char
      break
    end
  end
  cords_list[index] = line_coord
end
lines_2.each_with_index do |line, index|
  chars_array = line.split('')
  line_coord = ''
  chars_array.reverse!
  chars_array.each do |char|
    if integer?(char)
      line_coord += char
      break
    end
  end
  cords_list[index] += line_coord
end

puts(cords_list.sum { |n| n.to_i })
