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
  one: [{ pos: 4, score: 0, count: 1 }],
  two: [{ pos: 8, score: 0, count: 1 }]
}

def multiverse_increment(player, turn)
  new_player = []
  @sums.each do |score, universe_count|
    new_pos = player[:pos] + score
    new_pos = new_pos%10 == 0 ? 10 : new_pos%10
    new_score = player[:score] + new_pos
    new_count = player[:count]*universe_count
    new_player << { pos: new_pos, score: new_score, count: new_count }
  end
  new_player
end

turn = 1
player = :one
while(turn < 7) do
#while !@players.map { |z, v| v.map { |i| i[:score] } }.flatten.any? { |z| z >= 8 } do
  results = []
  @players[player].each do |player|
    inner_results = multiverse_increment(player, turn)
    inner_results.each do |inner|
      item = results.detect { |r| r[:score] == inner[:score] && r[:pos] == inner[:pos] }
      if !item.nil?
        item[:count] += inner[:count]
      else
        results << inner
      end
    end
  end
  @players[player] = results
  player = player == :one ? :two : :one
  turn += 1
end

loser = :one
#loser = :two if @players[:one].map { |i| i[:score] }.flatten.any? { |z| z > 20 }

p @players[loser].map { |z| z[:score] }
p @sums.values.sum
p @players[loser].map { |z| z[:count] }.sum #inject(:*)
