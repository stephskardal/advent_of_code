require "./helpers"
require "set"
require "./pqueue"

# Well, this is good enough for me. Bleh.

data = read_input('input.txt')

@board = data.map { |row| row.split('').map(&:to_i) }

def neighbor(input, y, x, rows, cols)
  out = []

  [[0, 1], [0, -1], [1,0], [-1, 0]].each do |shift|
    next_x = x + shift[0]
    next_y = y + shift[1]
    if next_x >= 0 && next_y >= 0 && next_x < cols && next_y < rows
      out.append([next_x, next_y])
    end
  end

  out.map {|el| [el.last, el.first]}
end

def dijkstra(matrix)
  # starting and end points
  rows = matrix.length
  cols = matrix[0].length
  origin = [0, 0]
  destination = [rows - 1, cols - 1]

  checked = Set[]
  q = PQueue.new
  q.push([0, origin])
  costs = {}

  until q.empty?
    cost, node = q.shift
    return cost if node == destination

    checked.add(node)
    row, col = node

    neighbor(matrix, row, col, rows, cols).each do |a|
      calculated_cost = cost + matrix[a[0]][a[1]]
      if calculated_cost < costs.fetch(a, 99999)
        costs[a] = calculated_cost
        q.push([calculated_cost, a])
      end
    end
  end
end

result = dijkstra(@board)
p "Part 1: #{result}"

rows = @board.length
cols = @board.first.length

new_board = Array.new(rows*5){Array.new(cols*5)}

(0..rows - 1).each do |row|
  (0..cols - 1).each do |col|
    (0..4).each do |row_times|
      (0..4).each do |col_times|
        v = @board[row][col] + row_times + col_times
        v = v%9 if v > 9
        new_board[row + row_times*cols][col + col_times*rows] = v
      end
    end
  end
end

result = dijkstra(new_board)
p "Part 2: #{result}"
