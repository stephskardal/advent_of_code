require "./helpers"

data = read_input('input.txt')

def increment_by_one(board, rows, cols)
  (1..rows - 2).each do |row|
    (1..cols - 2).each do |col|
      if board[row][col] == 9
        board[row][col] = 0
      else
        board[row][col] += 1
      end
    end
  end
end

def neighbor_adds(board, rows, cols)
  neighbor_hash = {}
  still_added = true
  shifts = [[-1, 0], [-1, 1], [0, 1], [1,1], [1, 0], [1, -1], [0, -1], [-1, -1]]

  while(still_added) do
    still_added = false
    (1..rows - 2).each do |row|
      (1..cols - 2).each do |col|
        next if board[row][col] == 0

        neighbors = shifts.map { |shift| [row + shift[0],col + shift[1]] }
        neighbors.compact.select { |neighbor| board[neighbor[0]][neighbor[1]] == 0 }.each do |neighbor|
          neighbor_hash["#{row}-#{col}"] ||= []
          if !neighbor_hash["#{row}-#{col}"].include?(neighbor)
            still_added = true
            neighbor_hash["#{row}-#{col}"] << neighbor
            if [9, 0].include?(board[row][col])
              board[row][col] = 0
            else
              board[row][col] += 1
            end
          end
        end
      end
    end
  end
  board
end

board = create_boards(data, '')[0]
board = pad_board(board)

cols = board[0].length
rows = board.transpose[0].length

(1..rows - 2).each do |row|
  (1..cols - 2).each do |col|
    board[row][col] = board[row][col].to_i
  end
end

steps = 10000

flash_sum = 0
(0..steps - 1).each do |step|
  # one by one and neighborly flashes
  increment_by_one(board, rows, cols)
  board = neighbor_adds(board, rows, cols)

  flash_sum += board.flatten(2).count(0)

  if step == 99
    p "PART 1: #{flash_sum}"
  end
  if board.flatten(2).count(0) == 100
    p "PART 2: #{step + 1}"
    break
  end
end
