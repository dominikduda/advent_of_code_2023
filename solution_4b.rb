file = File.open('input_4.txt').read
cards = file.split("\n")

def matching_numbers_count(card)
  winning_numbers, numbers_you_have = card[8..].split(' | ')
  winning_numbers = winning_numbers.split(' ').map(&:to_i)
  numbers_you_have = numbers_you_have.split(' ').map(&:to_i)

  card_matching_numbers_count = 0
  numbers_you_have.each do |given_number|
    next unless winning_numbers.include?(given_number)

    card_matching_numbers_count += 1
  end
  card_matching_numbers_count
end

card_copies = []

i = 0
loop do
  card = cards[i]

  break if card.nil?

  card_matching_numbers_count = matching_numbers_count(card)
  if card_matching_numbers_count > 0

    copy_amount = 1 + card_copies.count { |card_copy| card == card_copy }

    copies = cards[(i + 1)..(i + card_matching_numbers_count)]
    card_copies.push((copies * copy_amount))
    card_copies = card_copies.flatten
  end
  i += 1
end

puts cards.length + card_copies.length
