require "./helpers"

data = read_input('input.txt')

starting_board = create_boards(data)[0].map { |z| z[0].split('') }
@rows = starting_board.size
@cols = starting_board[0].size

def move_easters(board)
  new_pos = []
  clear_pos = []

  (0..@rows - 1).each do |row|
    (0..@cols - 1).each do |col|
      next if board[row][col] != '>'
      new_col = (col == @cols - 1) ? 0 : col + 1

      if board[row][new_col] == '.'
        new_pos << [row, new_col]
        clear_pos << [row, col]
      end
    end
  end
  new_pos.each { |new| board[new[0]][new[1]] = '>' }
  clear_pos.each { |c| board[c[0]][c[1]] = '.' }
  return board, new_pos.size
end

def move_southers(board)
  new_pos = []
  clear_pos = []

  (0..@rows - 1).each do |row|
    (0..@cols - 1).each do |col|
      next if board[row][col] != 'v'
      new_row = (row == @rows - 1) ? 0 : row + 1

      if board[new_row][col] == '.'
        new_pos << [new_row, col]
        clear_pos << [row, col]
      end
    end
  end
  new_pos.each { |new| board[new[0]][new[1]] = 'v' }
  clear_pos.each { |c| board[c[0]][c[1]] = '.' }
  return board, new_pos.size
end

board = starting_board
step = 1
while(true) do
  board, count_e = move_easters(board)
  board, count_s = move_southers(board)
  if (count_e + count_s) == 0
    break
  end
  step += 1
  p "step: #{step} and count: #{count_e + count_s}"
end

p "STEP #{step}"
