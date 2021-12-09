def read_input(filename = 'input.txt')
  File.open(filename).readlines.map(&:chomp)
end

def create_boards(data, split_char = " ")
  boards = []
  board = []
  while(data.size > 0) do
    shifted = data.shift.gsub(/^ /, '').split(split_char)
    if shifted.empty?
      boards << board
      board = []
    else
      board << shifted
    end
  end
  boards << board if board.any?
  boards
end

def pad_board(board, pad_char = nil)
  board.each do |row|
    row.unshift(nil)
    row.push(nil)
  end

  new_board = []
  board.transpose.each do |row|
    row.unshift(nil)
    row.push(nil)
    new_board << row
  end
  new_board.transpose
end
