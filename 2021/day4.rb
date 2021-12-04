require "./helpers"

def board_wins(board, called)
  (board + board.transpose).any? { |set| set.all? { |number| called.include?(number) } } ? board : nil
end

# Part 1
data = read_input('input.txt')
calls = data.shift.split(',')
throw_away = data.shift
boards = create_boards(data)
called = []
found_winner = false

while(!found_winner) do
  called << calls.shift
  winners = boards.map { |board| board_wins(board, called) }.compact
  if winners.any?
    found_winner = winners.first
  end
end

p called.last.to_i*found_winner.flatten(3).select { |b| !called.include?(b) }.map(&:to_i).inject(:+)

# Part 2
data = read_input('input.txt')
calls = data.shift.split(',')
throw_away = data.shift
boards = create_boards(data)
called = []
last_board_won = nil

while(boards.any?) do
  called << calls.shift
  winners = boards.map { |board| board_wins(board, called) }.compact
  if winners.any?
    last_board_won = winners.first
    boards = boards.select { |b| !winners.include?(b) }
  end
end

p called.last.to_i*last_board_won.flatten(3).select { |b| !called.include?(b) }.map(&:to_i).inject(:+)
