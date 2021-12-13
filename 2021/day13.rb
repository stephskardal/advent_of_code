require "./helpers"

data = read_input('input.txt')

folds = data.select { |b| b.match(/fold/) }
data.pop(folds.length + 1)

cols = data.map{ |z| z.split(',')[0].to_i }.max
rows = data.map{ |z| z.split(',')[1].to_i }.max

print "This part takes a long time in Ruby ... (30 seconds)"
board = []
(0..rows).each do |row|
  board[row] = []
  print "row: #{row}\n"
  (0..cols).each do |col|
    board[row][col] = data.include?("#{col},#{row}") ? "#" : "."
  end
end

def fold(board, fold, fold_type)
  if fold_type == 'fold along x'
    board = board.transpose
  end

  new_board = []
  (0..fold - 1).each do |row|
    new_row = []
    (0..board[row].length - 1).each do |col|
      new_row << ([board[row][col], board[2*fold - row][col]].any? { |b| b == "#" } ? "#" : ".")
    end
    new_board << new_row
  end
  board = new_board

  if fold_type == 'fold along x'
    board = board.transpose
  end
  board
end

folds.each_with_index do |fold, index|
  (description, amount) = fold.split('=')
  board = fold(board, amount.to_i, description)
  if index == 0
    print "Part 1: #{board.flatten(2).count("#")}\n"
  end
end

print "\n\nPart 2:\n"
print_board(board)
