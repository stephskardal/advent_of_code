def input
  "2,15,0,9,1,20".split(",")
end

# data => input
# last_num => 2020, 30000000
def part_1_and_2(data, last_num)
  history = data.inject({}) { |h, d| h[d] = [data.index(d) + 1]; h }
  inc = data.size + 1
  while(inc < last_num + 1)
    puts "inc: #{inc}" if inc % 1000000 == 0
    previous_pos = data[inc - 2]
    prev_history = history[previous_pos]
    new_number = (prev_history.nil? || prev_history.size == 1) ? "0" : prev_history[0] - prev_history[1]
    history[new_number.to_s] ||= []
    history[new_number.to_s].unshift(inc)
    history[new_number.to_s].slice(0,2)
    data.push(new_number.to_s)
    inc+=1
  end
  data.last
end
