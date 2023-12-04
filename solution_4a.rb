file = File.open('input_4.txt').read
cards = file.split("\n")

sum = 0
cards.each do |card|
  normalized = card[10..]
  winning_numbers, numbers_you_have = normalized.split(' | ')
  winning_numbers = winning_numbers.split(' ').map(&:to_i)
  numbers_you_have = numbers_you_have.split(' ').map(&:to_i)

  card_score = 0
  numbers_you_have.each do |given_number|
    next unless winning_numbers.include?(given_number)

    card_score = if card_score == 0
                   1
                 else
                   card_score * 2
                 end
  end
  sum += card_score
end

puts sum
