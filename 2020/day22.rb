def cards
  {
    player_1: [40, 26, 44, 14, 3, 17, 36, 43, 47, 38, 39, 41, 23, 28, 49, 27, 18, 2, 13, 32, 29, 11, 25, 24, 35],
    player_2: [19, 15, 48, 37, 6, 34, 8, 50, 22, 46, 20, 21, 10, 1, 33, 30, 4, 5, 7, 31, 12, 9, 45, 42, 16]
  }
end

def part_1
  data = cards
  while(data.values.none? { |b| b.empty? }) do
    card_1 = data[:player_1].shift
    card_2 = data[:player_2].shift
    if card_1 > card_2
      data[:player_1] += [card_1, card_2]
    else
      data[:player_2] += [card_2, card_1]
    end
  end

  winner = data.select { |k, v| v.any? }
  puts "Part 1: #{winner.values[0].reverse.map.with_index { |card, index| card*(index+1) }.sum}"
end

def play_round(cards, game_number = 1)
  history = {}
  history_repeated = false
  while(!history_repeated && cards[:player_1].any? && cards[:player_2].any?) do
    key = "#{cards[:player_1].join('-')}--#{cards[:player_2].join('-')}"
    if history.has_key?(key)
      history_repeated = true
    else
      history[key] = true
      card_1 = cards[:player_1].shift
      card_2 = cards[:player_2].shift
      if cards[:player_1].size >= card_1 && cards[:player_2].size >= card_2
        new_cards_1 = cards[:player_1][0..card_1 - 1]
        new_cards_2 = cards[:player_2][0..card_2 - 1]
        winner = play_round({ player_1: new_cards_1, player_2: new_cards_2 }, game_number + 1)
      else
        winner = card_1 > card_2 ? :player_1 : :player_2
      end

      if winner == :player_1
        cards[:player_1] += [card_1, card_2]
      else
        cards[:player_2] += [card_2, card_1]
      end
    end
  end

  if game_number == 1
    winner = cards[:player_1].any? ? :player_1 : :player_2
    puts "Part 2: #{cards[winner].reverse.map.with_index { |card, index| card*(index+1) }.sum}"
  else
    return (cards[:player_1].any? || history_repeated) ? :player_1 : :player_2
  end
end

part_1
play_round(cards, 1)
