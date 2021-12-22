require "./helpers"

# Part 1
@players = {
  one: { pos: 10, score: 0 },
  two: { pos: 7, score: 0 }
}

def increment_position(player, turn)
  score = turn*9 - 3
  new_pos = @players[player][:pos] + score
  new_pos = new_pos%10 == 0 ? 10 : new_pos%10
  new_score = @players[player][:score] + new_pos
  @players[player] = { pos: new_pos, score: new_score }
end

turn = 1
player = :one
while(@players.values.all? { |p| p[:score] < 1000 }) do
  increment_position(player, turn)
  player = player == :one ? :two : :one
  turn += 1
end

loser = @players.select { |z, v| v[:score] < 1000 }.keys.first
p "Part 1: #{@players[loser][:score]*(turn - 1)*3}"

# Find number of universes per roll
# Well, I tried
dice = [1, 2, 3]
combos = dice.product(dice.product(dice))
@sums = Hash.new(0)
combos.each { |z| @sums[z.flatten.sum] += 1 }

@universes = 1
@players = {
  one: [{ pos: 0, score: 0, universe_count: 1 }],
  two: [{ pos: 8, score: 0, universe_count: 1 }]
}

@found_win = []

def multiverse_increment(key, player, turn)
  result = []
  player.each do |universe_player|
    @sums.each do |score, universe_count|
      new_pos = universe_player[:pos] + score
      new_pos = new_pos%10 == 0 ? 10 : new_pos%10
      new_score = universe_player[:score] + new_pos
      new_count = universe_player[:universe_count]*universe_count
      j = { pos: new_pos, score: new_score, universe_count: new_count }

      if turn < 4
        result << multiverse_increment(key, [j], turn + 2)
      else
        result << j
      end
    end
  end

  # Dedupping for speed
  after_turn = result.flatten
  dedupped = []
  after_turn.each do |inner|
    items = after_turn.select { |r| r[:score] == inner[:score] && r[:pos] == inner[:pos] }
    if items.size > 1
      count = items.map { |z| z[:universe_count] }.sum
      dedupped << { score: inner[:score], pos: inner[:pos], universe_count: count }
    else
      dedupped << inner
    end
  end

  universe_count = dedupped.collect { |b| b[:universe_count] }.sum
  max_score = dedupped.collect { |b| b[:score] }.max
  @found_win[turn] = {
    player: key,
    universe_count: universe_count,
    max_score: max_score
  }
  dedupped
end

result = multiverse_increment(:one, @players[:one], 1)
result = multiverse_increment(:two, @players[:two], 2)

p @found_win
