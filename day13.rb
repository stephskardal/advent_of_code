def part_1(timestamp, data, mods = [])
  buses = data.split(',').delete_if { |a| a == "x" }.map(&:to_i)
  found = false
  og_timestamp = timestamp
  while(!mods.any? { |b| b == 0 })
    mods = buses.map { |bus| timestamp % bus }
    timestamp += 1
  end
  "#{buses[mods.index(0)]*(timestamp-og_timestamp - 1)}"
end

def part_2(data)
  mods = data.map.with_index { |b, index| [b, index] }.delete_if { |a| a[0] == "x" }.map { |b| "(x+#{b[1]}) mod #{b[0]} == 0" }.join(',')

  # Brute force similar to the method above
  # But, Ruby is not particular fast on this

  # And then plug into wolframalpha because I don't do that kind of math
end

def bus_inputs
  # 1001796

  "37,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,457,x,x,x,x,x,x,x,x,x,x,x,x,13,17,x,x,x,x,x,x,x,x,23,x,x,x,x,x,29,x,431,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,19"
end
