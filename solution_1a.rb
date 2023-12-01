file = File.open('input_1a.txt').read
lines = file.split("\n")

def integer?(string_number)
  string_number.to_i.to_s == string_number
end

sum = 0

lines.each do |line|
  chars_array = line.split('')
  line_coord = ''
  chars_array.each do |char|
    if integer?(char)
      line_coord += char
      break
    end
  end
  chars_array.reverse!
  chars_array.each do |char|
    if integer?(char)
      line_coord += char
      break
    end
  end
  sum += line_coord.to_i
end

puts sum
