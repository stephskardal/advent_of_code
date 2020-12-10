def n_choose_k(n, k)
  # puts "#{n} and #{k}"
  return 1 if n == k
  return 0 if k == 0
  (k + 1 .. n).reduce(:*) / (1 .. n - k).reduce(:*)
end

def part_1(data)
  totals = {}
  (1..data.size - 1).each do |index|
    puts "index: #{index} size: #{data.size}"
    diff = (data[index] - data[index - 1]).to_s
    totals[diff] ||= 0
    totals[diff] += 1
  end
  # something weird with adding one?
  totals["3"] += 1
  totals["1"] += 1
  totals["3"]*totals["1"]
end

# 9256148959232
def part_2(data)
  required_vals = []
  (0..data.size - 1).each do |index|
    if(index != 0 && ((data[index] - data[index - 1]) == 3))
      required_vals << data[index]
      required_vals << data[index - 1]
    end
    if(index == 0 || index == (data.size - 1))
      required_vals << data[index]
    end
  end
  required_vals = required_vals.sort.uniq
  remaining_vals = data - required_vals

  counts = []
  (1..required_vals.size - 1).map do |index|
    in_between = remaining_vals.select { |b| b < required_vals[index] && b > required_vals[index - 1] }

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

def really_short_inputs
  "16
10
15
5
1
11
7
19
6
12
4".split("\n").map(&:to_i).sort
end

def short_inputs
  "0
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3".split("\n").map(&:to_i).sort
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
72
0".split("\n").map(&:to_i).sort
end
