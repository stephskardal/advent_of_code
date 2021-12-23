require "./helpers"

def calculate_cost(pod_cost, move)
  start_p, end_p = move
  moves = (start_p[0] - end_p[0]).abs + (start_p[1] - end_p[1]).abs
  moves*pod_cost
end

#############
#...........#
###B#C#B#D###
###A#D#C#A###
#############

def print_board(board, round, game_finished)
  print_board = Array.new(13){Array.new(4, '#')}
  board.each do |key, value|
    pos = value[:moves].last
    print_board[pos[0]][pos[1]] = @pods[key][:char]
  end
  @print_pos.each do |pos|
    if print_board[pos[0]][pos[1]] == '#'
      print_board[pos[0]][pos[1]] = '.'
    end
  end
  puts "ROUND: #{round} -- #{game_finished}"
  print_board.transpose.each do |row|
    inner = []
    puts row.compact.join('')
  end
  puts ''
end

@pods = {
  seapod_a1: { cost: 1, final_dest: [[3, 1]], char: 'A' },
  seapod_a2: { cost: 1, final_dest: [[3, 2]], char: 'A' },
  seapod_b1: { cost: 10, final_dest: [[5, 2], [5, 1]], char: 'B' },
  seapod_b2: { cost: 10, final_dest: [[5, 2], [5, 1]], char: 'B' },
  seapod_c1: { cost: 100, final_dest: [[7, 1]], char: 'C' },
  seapod_c2: { cost: 100, final_dest: [[7, 2]], char: 'C' },
  seapod_d1: { cost: 1000, final_dest: [[9, 2], [9, 1]], char: 'D' },
  seapod_d2: { cost: 1000, final_dest: [[9, 2], [9, 1]], char: 'D' }
}
@landing_pos = [[1, 0], [2, 0], [4, 0], [6, 0], [8, 0], [10, 0], [11,0]]
board = {
  seapod_a1: { cost: 0, moves: [[9, 2]], finished: false },
  seapod_a2: { cost: 0, moves: [[3, 2]], finished: true },
  seapod_b1: { cost: 0, moves: [[3, 1]], finished: false },
  seapod_b2: { cost: 0, moves: [[7, 1]], finished: false },
  seapod_c1: { cost: 0, moves: [[5, 1]], finished: false },
  seapod_c2: { cost: 0, moves: [[7, 2]], finished: true },
  seapod_d1: { cost: 0, moves: [[5, 2]], finished: false },
  seapod_d2: { cost: 0, moves: [[9, 1]], finished: false }
}

@print_pos = @landing_pos + [[5,0], [3,0], [7,0], [9,0]]
@pods.each do |p, v|
  v[:final_dest].each do |final|
    @print_pos << final
  end
end

def set_finished(board)
  board.each do |k, v|
    if @pods[k][:final_dest].include?(board[k][:moves].last)
      other_key = (k.to_s.match(/2/) ? k.to_s.gsub(/2/, '1') : k.to_s.gsub(/1/, '2')).to_sym
      if board[k][:moves].last == 1 && @pods[other_key][:final_dest].include?(board[other_key][:moves].last)
        board[k][:finished] = true
      end
    end
  end
  board
end

def make_move(board, round, last_key)
  if round == 16
    return
  end

  board = set_finished(board)
  game_finished = board.values.select { |v| v[:finished] }.count
  if game_finished == 8
    print "found winner:"
    p board
    print_board(board, round)
    return board
  end

  if game_finished > 2
    print_board(board, round, game_finished)
  end

  @pods.each do |pod_key, value|
    next if last_key == pod_key
    next if board[pod_key][:finished]
    next if board[pod_key][:moves].size >= 3
    next if blocked(pod_key, board)

    # Determine destination options with move, preferring nested item, otherwise item
    # Need to adjust preferred destinations
    already_finished = board.values.select { |z| z[:finished] }.map { |z| z[:moves].last }
    destinations = value[:final_dest] - already_finished
    if board[pod_key][:moves].size < 2
      destinations += @landing_pos
    end

    # Iterate through each destination
    destinations.each do |option|
      # Identifying blocked options either by ones in or in the way
      option_blocked = board.map { |k, v| v[:moves].last }.include?(option)
      l_moves = [board[pod_key][:moves].last[0],option[0]].sort
      if board.any? { |k, v| v[:moves].last[1] == 0 && v[:moves].last[0] > l_moves[0] && v[:moves].last[0] < l_moves[1] }
        option_blocked = true
      end
      if !option_blocked
        spawn_board = board.dup
        spawn_board[pod_key][:moves] << option
        make_move(spawn_board, round + 1, pod_key)
      end
    end
  end
end

def blocked(key, board)
  pos = board[key][:moves].last
  blocked = pos[1] == 2 && board.values.any? { |z| z[:moves].last[0] == pos[0] && z[:moves].last[1] == 1 }
  return blocked
end

make_move(board, 1, nil)
