def read_input(filename = 'input.txt')
  File.open(filename).readlines.map(&:chomp)
end

def to_decimal(binary)
  binary.reverse.chars.map.with_index do |digit, index|
    digit.to_i * 2**index
  end.sum
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
    row.unshift(pad_char)
    row.push(pad_char)
  end

  new_board = []
  board.transpose.each do |row|
    row.unshift(pad_char)
    row.push(pad_char)
    new_board << row
  end
  new_board.transpose
end

def print_board(board)
  board.each do |row|
    inner = []
    puts row.compact.join('')
  end
end
