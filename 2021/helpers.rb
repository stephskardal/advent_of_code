def read_input(filename = 'input.txt')
  File.open(filename).readlines.map(&:chomp)
end

def create_boards(data)
  boards = []
  board = []
  while(data.size > 0) do
    shifted = data.shift.gsub(/^ /, '').split(" ")
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
