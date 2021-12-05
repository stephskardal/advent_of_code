require "./helpers"

def build_board(max)
  board = (0..max).map do |cols|
    (0..max).map { |b| 0 }
  end
end

def increment_board(board, x, y)
  key = "#{x}-#{y}"
  board[key] ||= 0
  board[key] += 1
  board
end

def print_board(max, board_hash)
  board = build_board(max)
  board.each_with_index do |row, index|
    inner = []
    row.each_with_index do |col, col_index|
      key = "#{index}-#{col_index}"
      inner << (board_hash.has_key?(key) ? "#{board_hash[key]} " : '. ')
    end
    puts "#{inner.join('')}\n"
  end
end

# Part 1 & 2 - Bonus, at the same time
data = read_input('input.txt')

all_c = []
data.each do |line|
  coords = line.split(' -> ')[0].split(',').map(&:to_i), line.split(' -> ')[1].split(',').map(&:to_i)
  all_c << coords
end

board = {}
new_board = {}

all_c.each do |coord|
  if coord[0][0] == coord[1][0]
    z = [coord[0][1], coord[1][1]].sort

    (z[0]..z[1]).each do |i|
      board = increment_board(board, i, coord[0][0])
      new_board = increment_board(new_board, i, coord[0][0])
    end
  elsif coord[0][1] == coord[1][1]
    z = [coord[0][0], coord[1][0]].sort
    (z[0]..z[1]).each do |i|
      board = increment_board(board, coord[0][1], i)
      new_board = increment_board(new_board, coord[0][1], i)
    end
  else
    if coord[0][1] < coord[1][1] # bottom to top
      y_range = (coord[0][1]..coord[1][1]).to_a
    else # top to bottom
      y_range = (coord[1][1]..coord[0][1]).to_a.reverse
    end
    if coord[0][0] > coord[1][0] # right to left
      x_range = (coord[1][0]..coord[0][0]).to_a.reverse
    else #left to right
      x_range = (coord[0][0]..coord[1][0]).to_a
    end
    x_range.each_with_index do |i, index|
      new_board = increment_board(new_board, y_range[index], x_range[index])
    end
  end
end

p "Part 1: #{board.values.select { |b| b > 1 }.count}"
p "Part 2: #{new_board.values.select { |b| b > 1 }.count}"
# print_board(all_c.flatten(2).max, new_board)
