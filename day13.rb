# 1001796
# 37-0
# 41-27
# 457-37
# 13-50
# 17-51
# 23-60
# 29-66
# 431-68
# 19-87

def part_1(data)
  # I don't have this anymore because I wrote it pretty fast.
end

def part_2(data)
  mods = data.map.with_index { |b, index| [b, index] }.delete_if { |a| a[0] == "x" }.map { |b| "(x+#{b[1]}) mod #{b[0]} == 0" }.join(',')
  # And then plug into wolframalpha because I don't do that kind of math
end

def inputs
  "37,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,457,x,x,x,x,x,x,x,x,x,x,x,x,13,17,x,x,x,x,x,x,x,x,23,x,x,x,x,x,29,x,431,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,19".split(",")
end
