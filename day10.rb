def part_1(data)
  combos = data.each_cons(2).to_a.map{ |b| b[1] - b[0] }
  combos.count(3)*combos.count(1)
end

def part_2(data)
  required_vals = []
  data = data.unshift(0)
  new_required = [0, data.each_cons(2).to_a.select { |b| b[1] - b[0] == 3 }, data.last].flatten.uniq
  remaining_vals = data - required_vals

  counts = []
  new_required.each_cons(2).to_a.each do |bounds|
    in_between = remaining_vals.select { |b| b > bounds[0] && b < bounds[1] }
    puts "#{in_between} #{bounds.inspect}"

    next if in_between.empty?

    case in_between.size
    when 3
      counts << 7
    when 2
      counts << 4
    when 1
      counts << 2
    else
      # do nothing
    end
  end
  counts.reduce(:*)
end

def inputs
  "26
97
31
7
2
10
46
38
112
54
30
93
18
111
29
75
139
23
132
85
78
99
8
113
87
57
133
41
104
98
58
90
13
91
20
68
103
127
105
114
138
126
67
32
145
115
16
141
1
73
45
119
51
40
35
150
118
53
80
79
65
135
74
47
128
64
17
4
84
83
147
142
146
9
125
94
140
131
134
92
66
122
19
86
50
52
108
100
71
61
44
39
3
72".split("\n").map(&:to_i).sort
end
