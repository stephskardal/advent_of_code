require "./helpers"

data = read_input('input.txt')

# Part 1
board = create_boards(data, '')[0]
board = pad_board(board)

cols = board[0].length
rows = board.transpose[0].length

shifts = [[-1, 0], [1, 0], [0, -1], [0, 1]]
basin_index = 0
basins = {}
smalls = []
(1..rows - 2).each do |row|
  (1..cols - 2).each do |col|
    neighbors = shifts.map { |shift| board[row + shift[0]][col + shift[1]] }
    if neighbors.compact.all? { |neighbor| neighbor.to_i > board[row][col].to_i }
      smalls << board[row][col]
      basins["#{row}-#{col}"] = basin_index
      basin_index += 1
    end
  end
end

p "Part 1: #{smalls.map { |b| b.to_i + 1 }.inject(0, :+)}"

total_boundaries = board.flatten(2).count("9")
total_points = (rows-2)*(cols-2)
non_boundaries = total_points - total_boundaries
p "Total points needing definitions: #{non_boundaries}"

while(basins.keys.count < non_boundaries) do
  (1..rows - 2).each do |row|
    (1..cols - 2).each do |col|
      next if board[row][col] == "9"

      neighbors = shifts.map do |shift|
        basins["#{row + shift[0]}-#{col + shift[1]}"] if ![nil, "9"].include?(board[row + shift[0]][col + shift[1]])
      end.compact
      if neighbors.any?
        basins["#{row}-#{col}"] = neighbors.first
      end
    end
  end
end

p "Part 2: #{basins.values.tally.values.sort.pop(3).inject(1, :*)}"
