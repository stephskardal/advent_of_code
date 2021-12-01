def transform_by_loop(loop_size, value, subject = 1)
  loop_size.times do
    subject=(subject*value)%20201227
  end
  subject
end

def solve_loops(public_key, subject = 7)
  card_loop_size = 1
  while(subject != public_key)
    card_loop_size += 1
    subject=(subject*7)%20201227
  end
  card_loop_size
end

# Just one part, really
card_public = 1717001
door_public = 523731
card_loop_size = solve_loops(card_public)
door_loop_size = solve_loops(door_public)

puts "PART 1 DOOR: #{transform_by_loop(card_loop_size, door_public)}"
puts "PART 1 CARD: #{transform_by_loop(door_loop_size, card_public)}"
