def rules
"1: 121 99 | 96 13
111: 121 77
58: 96 71 | 121 59
81: 91 121 | 123 96
3: 65 96 | 55 121
26: 96 121 | 96 96
125: 121 23 | 96 64
56: 96 15 | 121 114
54: 123 96 | 46 121
21: 128 96 | 78 121
52: 33 91
6: 96 101 | 121 12
17: 89 121 | 46 96
38: 14 121 | 2 96
9: 121 123 | 96 103
42: 96 29 | 121 3
129: 26 96 | 89 121
67: 46 96 | 41 121
122: 6 96 | 20 121
50: 96 99 | 121 103
70: 121 103 | 96 103
60: 96 118 | 121 57
90: 32 96 | 106 121
19: 47 121 | 95 96
75: 98 96 | 85 121
15: 96 99 | 121 78
68: 129 121 | 116 96
102: 96 109 | 121 66
104: 110 121 | 54 96
59: 24 121 | 89 96
115: 24 96 | 46 121
29: 121 60 | 96 38
116: 41 33
108: 121 36 | 96 24
44: 121 89 | 96 36
119: 72 121 | 7 96
97: 121 86 | 96 44
80: 35 121 | 59 96
32: 128 121 | 123 96
28: 121 104 | 96 79
48: 34 96 | 69 121
92: 121 99 | 96 78
91: 121 121 | 96 121
127: 124 121 | 100 96
86: 13 96 | 36 121
61: 121 69 | 96 94
16: 13 121 | 91 96
12: 121 25 | 96 70
120: 121 107 | 96 17
8: 42
72: 87 121 | 37 96
84: 52 121 | 85 96
47: 26 96 | 46 121
18: 121 36 | 96 99
76: 26 121 | 103 96
24: 121 121
123: 96 96
36: 96 121
121: a
112: 96 39 | 121 4
46: 33 33
74: 121 1 | 96 10
128: 96 96 | 121 121
130: 33 77
126: 9 121 | 124 96
22: 121 77 | 96 128
55: 112 96 | 43 121
30: 121 13 | 96 78
41: 96 96 | 121 96
82: 126 121 | 102 96
99: 121 96 | 96 121
34: 91 121 | 128 96
57: 75 96 | 84 121
31: 121 88 | 96 119
77: 121 33 | 96 121
64: 34 121 | 117 96
25: 96 78 | 121 77
66: 121 13 | 96 24
49: 121 127 | 96 61
11: 42 31
106: 121 89 | 96 24
113: 21 96 | 130 121
73: 22 121 | 108 96
4: 9 96 | 81 121
7: 105 121 | 28 96
62: 96 99 | 121 46
0: 8 11
107: 78 96 | 36 121
117: 41 121 | 123 96
39: 83 96 | 85 121
13: 96 33 | 121 121
103: 121 96
95: 103 96 | 91 121
87: 113 96 | 56 121
51: 18 121 | 92 96
88: 121 122 | 96 5
94: 121 46 | 96 41
23: 96 53 | 121 17
114: 96 24
65: 82 96 | 49 121
69: 26 121
98: 121 13 | 96 26
79: 50 121 | 114 96
10: 123 121 | 89 96
63: 96 62 | 121 30
53: 96 41 | 121 89
93: 96 54 | 121 111
85: 96 26 | 121 123
14: 96 58 | 121 80
100: 121 89 | 96 13
37: 121 27 | 96 90
78: 121 121 | 33 96
27: 115 121 | 52 96
71: 99 121 | 91 96
118: 19 96 | 68 121
2: 121 120 | 96 74
40: 121 76 | 96 16
45: 96 48 | 121 131
109: 89 121 | 36 96
101: 59 96 | 95 121
43: 97 96 | 40 121
96: b
89: 96 33 | 121 96
35: 41 96 | 36 121
83: 96 26 | 121 99
20: 121 63 | 96 51
124: 89 96 | 103 121
5: 96 45 | 121 125
33: 121 | 96
131: 70 96 | 67 121
110: 121 36 | 96 41
105: 93 121 | 73 96
".split("\n").inject({}) { |h, b| h[b.split(':')[0]] = "#{b.split(':')[1]} "; h }
end

def inputs
"bbbaababaabaabaaabbaababbaaabbabbbaabaaababbbbba
bbbaaabbbabbababaabaaaaabababbaabbabbaaaabbaabba
aaabbbbbababbaabababbaabbbabbabbaabbabaaabababab
babbaabbbbabbbaaaabaabbbababbabaaababbaaaabbabbababbbbbb
bbaaabbbaaaaabbbbaaaabab
aababbaababbaaabbbabaaaaaabaababbabababbaabaaaabaabbaaab
abbbbbabaabaaaaababaabab
bbababbbbaaabaaaababbbba
abaabaaabbabbbabbbbbbaab
baaababbabaabbaaaaababba
bbaaabbbaaabaaabbaabbabaabababbbabbabaaabaabaaabaaababaa
babbbaabaaaaabbbaababbbb
aaaabbabbabbaaabbababaabbbabbbbaabaabbab
abbbbabbaabababbabbbabbababbaaaaabaaaaaabbbbbaab
abbabaaabaabbbabbbaababbbbaaaabbaaabaaabbbbbaabbaaabaaab
bbbbabbbbbbbabbbbbaababb
ababbaabbaabbbbbbbbabaaa
bbaabbbaaabababbbbbbbbba
baabbbababaabaaabaabbbaa
bbbaababaaabbbababbbababaabbaaba
bababaaabbaabaabaaaaabaa
aababbbababbbaaaaaaababa
aabaaaabbbbabaaaaaaaaaabbaaaabbbbbbaababaababbabababaaaabbabaaabaababbababababbbbabaabab
babbabaabaaaaaaaaabbbbbb
bbbbbababaaabbbaaabaaabb
babbbbababbaaaaaabbababa
bbbabbbbaaababbbabbbbbbb
abbabbabbaabaaaabababbab
baaabbbaabbbababbabbabaaaabbbaabbbabaaabaaabaaaa
bbbabbabbbaaaabbaaabababbaabbaaabbbbabbbbabbaabb
aaababbbaabbababababaaaa
aabaabbbaaaaabbbbababbbababaabbb
abbbabbaabbaabaabbbabbaabbaababa
bbaabbbabbabababbaabbabababbaaabbaaabbabbbbabbabbabaaaba
abbabbbbabababbbbbabbabaabaabbaabbbbbbababababaaabaaaaba
aabaaaaabbabaabbbbaabbaaabaaabbabbbbaabb
aaabbaabbabbaabbabaababb
ababaabbbaabbabbabaabaaa
bababaaaababaabbaaababaa
bbababbaababaaabbabbabba
aaaabbaabbabbbbaaaabbbaa
abbabbababbbbbbaabbbbbbabaaabbbbabaaabbbabaabaabaaaaaaaa
babbbaabbbbbbababaaaaaba
abbabbaabbbbaaaabaabaaab
bbaaaabbbbaabbaaaabaaabb
baaaabbbabbabbbabbbaababaaabaabababababbbaabababbbbaaaabaababababbabbbbaabbbaaab
aaabbbabbbbbbbabbaabbbabbbaaabbbbbababababaaabaa
abababaaababbababaabaabb
aabbbababbaaaabbabaabbab
aaabbaaaaababbbaaabababbabbbababbbaaaaabbbbabaaa
baaabbaaabaaabaababbbbabbabbaababbbbababbbbbbaababababba
aabbababbbbabbbbabaaaaab
bbabababbaaabaaabababbbbbaabaaaabababaaaabaaaaabbbbaabaa
aaaabbaabbbbaabaaaaaaaaa
baaababbbaaabbaababbbbabbaabbaaaaabbabbbaaabbabb
bbbabababaaabaaababaabba
bababbbabbbbbbbbbbabaaba
babbaaaaabbaababababbabbabbabaaaaabaabba
bbababbabaabbaabababbaabbbaaabbbbbbbabbbaaaabbababaabbbb
aaabbaaaabbbaaaaaaabbbbaaaaaabab
abbbbbabbabbbbbaaabaaaaabaabbaaa
ababbbaaaabbaabaababbababababababaaaabbbabbaabbbaaabbbabaababbbabaabaaab
aaaabbaaaaabbbbbababbaababaababa
aaabbbabaabbbabbabaabaaababaabaa
bbbbabaabbbabbbbbbaababa
abbaabbababaabaabaabbbaabbababbbbabaababbabaaaaaabbabbba
aaaabababbabaaabbabaabbbabbbaabaaabaaabaaabaabbaaabbbbabbaaaabba
aaabaaabaabbbababbababbaaaabbaab
ababbbaaaabaaabaababbaaa
babaaaabababababbabbbbabbbabbbab
aaabbaabbabbaabbbbbbbbaa
aaabbabbabbbaabbabbbbbbbabbabaaabaabbbbbbbbbaaabbabaababababbbbabababbbb
bbabaaaabaabbabaaaaaabba
abbbabbbaaabbbbaabaaaaab
baaabaaaaabbbabbabaaaaba
babbababbaabbbbbaababbab
abaaababaaabbabaabbbbbbbabababbbbaabbbbbabbaabbaaababaabbabbababaaabbaaababbaaab
babbbbbaabbbaaaababbbbaabaaaaaba
abbbababaaabbbbabbabaaaabbaaaababababbbbbbabbbaaabbbaaabbbaaaabb
babbaabbabaaaaaaaaabaaababaabbaaaabbbbbbaabbbbbb
ababaaabbbbbaabaabbabbbbabbbaaab
aaabaaabbbababbaaabaabaaabababbaabbbaaab
baabbbabbbaaaababbaaaaab
abbaaaabaabaabababaabbbb
bbbaabbaaabaababbbbbabba
aabbababbbabbbbbbbbbaaab
babaaabbabbbbabaabaaabab
baaabbbaaabbbaababababbaaababbab
bbbbaababbaabbbbaabbabaa
ababaabbabbaaaababaababa
bbbbbbababbbababbaaabaab
baabbbabbaabbabaaaabbbaa
abbbbabaaabababbababaaaa
abaabbaabbbbbbababaaabbb
bbabbabaabaabaaabbababbbbbbaaababbabaabbbaaababbbbabaaabababaababababbbbabababaa
bbaaaababbbbabaaabaaaaab
aaabaabbaabbbbbabbbbbababbbbbbaaabbaabaababbbaaabaababaaabbaabaa
abbbababaababaabbabbabba
bbaaaaabbaabbabbaabaabaabaaaaabbbabbaaaa
bbbbaababbaabaabbaabbaabbaabbabbabbbbababbbabbaabbbbaaabbbaaabaa
abaabaaaabababaabbaaabbbaaabaaaaabbbaaab
babbabaabbbbbabbbabbbbaabbabbabbaaaaaaababbaabaabaaaaaab
bbbabbbbbababaababbaabaa
aababbbbabbaaabaaababaab
aaababbbbbbabaaabbbaaaba
ababbabbaabbbbaaaabbbaaa
aaaabbabbabbbbbabaababab
bbbabaabaababbaabbababaa
bbaabbbaabbbaabaabbaaaabbaaababaaabbabba
aababbbaabbaabababbababbaabaabbabaaaaaabbabbabbbbbbabbaa
abababbabbabaabbaabbaaaaaababaababaaaaaabbabbababbaababbbabbabbb
abaabbbabaabbbababbbaabb
bbbaababbabbabaaabbbaabb
baabbbaaabbbbaabbaabaabbaabaabbabbabbbbabbbbbabbabbbbaaabaaaaababbaabbbaaaaaabba
baabbbbbaabbababababbbbb
bbabaaaaaabaaabbbaaabbaaabababbbaaaabbabbaabbaaaabbbaabbbbababaabbbbbbaa
aaabbbabaaabbaaabaabaabb
abaaaaaabaabbbbaabbaabba
baabbbabbabbaaabbbbababb
bbbaaaaaabbabbabbaabbabbbbbabbbababaaaba
abbbaabababaaabbabaaabab
bbbbbbbbbaabbaabbbbbaaab
bbbababaaabbaaaabbbbbabbaaaabbba
baaababbbaabbabbbbbaabaa
abababbababbbaaabbaabbaababbaabaaababbbb
babbbbbaaabbaabbaaaaaaaa
aaabbbabbbabbbaaabbaabba
aabbaaaabaabbbbbaaaabaaa
abbbbabbbaaabbabbbbabbaa
bbbaaaaabbabababbbabbaaa
babbbababaabbaaaababbabaabbaaaababaababa
abbbabbaaabbaabbbabaabba
abbbabaaaabababbaabbabbb
bbbbabaabbbbaababbaabbab
aabaabaaabababbaabbbbbaa
aaabbbabaabbbbabaaaaabbbababbbbaaaaaaaabbbaaabba
ababaaabababaabbaabbbbaaaaaabaaabaababaa
babababaaababbbabbabbaababaaaaaaabaaabaa
bbabababbaabbaababbbaabababbababaabaabba
aabbbababababaabbaababaa
bbabbbaabaabbaaabbabaaba
bbaaaaaaaabbaaabaaabbabbaaaaaaaa
aaababbbabbbbababaabbbaa
babbaabbbabbbbaaaaaababa
bbaaaaabbaababbbaaabaaabbbaababaabbbaabbabaababaabbbabba
ababbaabbaaababaabbbbbaabbbbaabbbbabaaab
babbaaababbabbbbbaaababa
bbabaabbaabbbabbbababaabbaaaabbabaaaaaba
babbbaabbbbabbbabbbbbaab
aabababbabbbbbabbbbbbaab
ababbaababbabaabbbabbbbbbbababababbababaabbababb
abbabbabbabbbabbbbaabbbaaabbababbbbabbab
baaabbabbaaababbbbbabbbbaaaabaaa
bbaaaabbbbbbbabbbbabbabbbaababbbaaabaaaa
baaabbbbbbbaaabbaaaaaabb
bbababbbabaabbaaabbababb
abbaababbababbbababbabaaaabaaaaaaaaabaaa
aabbababaaaaaababbbaabbb
bbabaabbbabbaaabbabbbaaababaabaa
bbbbbabaaaabbbbbaababaaa
aaabbbbbaabaabaababababb
aabababaaabbaabaabababbabaaaabbaababaaababaabbaabaabbabbaabbbbaababaabab
baaaaaaabaaaaaaaaaabaaba
baabbabaaabbaabbbabbbabb
baabbbbbaaababbbbaaabbabbbbaaaba
baaaaabbaaabababbbbaabbb
bbbaabababbabbbbabaabaab
bbbabbabbaabbbbabbaaabaa
babbbbabbabababbbbabbabaabbbabab
abaabbbabababaababaaabab
abaaaaaaabaabbaabbbbaababaabaabbabaaabaa
aabbababababaaabbabbbababbaabbababaaaaab
bbabababbbababbbababbbbb
abbabbbabbaaababbabbbbbbabbabbaa
bbabaaaabbaabbbaaabbabaa
aababbbaabaabbaaaaaaabaa
abababaaaababaababbaaababbaababa
bbbaaabbabaabbbaabbbaabb
bababaaababbbaabaabababa
bbbabaababababbbaaaaaabaaaabaabbbabaabbb
babbababbbbbbaaabbbbaabababbbbaabbbabbaa
babbabaabaabbbbbbabbabaabbababaa
aaaaabbbbbabbbabbbabaaba
babbaabbbabbbbaabaababbbaabbabbbbaababaa
ababbabaabbaabababaaabbb
aaaabbabaabaabbabaabbbaa
bbabbaabbabbbbaaaabaaaaababaabba
babaaabbabbbaaaaabaabbab
bbbbabaaaabbbabaaabbabba
aabbbabbbabaaaabaabbbbbb
bbbbabaababbabaaaabbbbababbaabba
abbbaaaaabbaababbaabaaab
bbababbbbabbababbabbbaaabbbaabaaaaaaaabbbbaaabbaabaabbabbabaabbb
babbababbaaabbbabbaaabab
ababaabbbbbaaabbabbaababaabbabaa
baaabbbbabbaabbbbbbabbabbbbbbbabbaaaabbbaabaaaabaabbabbb
aaaaabbbbbbbaababaaababa
bbbabbabaabbbabbaabbabab
abababbabbbbbaaaabbaaaba
bababbbaabaabbbaaabababa
abbbabbaabbaaaabaaabbbbbbabbababaabbaaabbbabbaaaaaaabaab
ababbbaabbabbbbabbabbbaaaaabaaaa
aaaaaababbbaaaaaaabaaaaabaabbaabbbbaabbb
bbbbbaaababbaabbbbaabbab
bbbbbaabbbabaabaabaaabaaaabaabbaabbabaabbbbbababbbbababbbbbababaaaabaaababaaabaa
babaaabbaaaaabbbaaabbabb
bbababbabaabaaaababbabbb
babbbababaabbbbbaaabaaaa
bbbbbaaababbababababaaaabaabaaabbbababbababaaaabbbbababaaabbaaabaababbab
aabaababbabbbbbabbabbaaa
bbababababbaabababbababa
aabababbaaabbaabbbaaaaaa
aababaabbaaabbabbaabaaab
abbabaabbabababaaabaaabb
babbaaabbababaabaaabbbaa
bababababbbbbaaaaababbab
bbaabbbbbabaaabbabaaaaab
bbabbbbbbababababbaaabba
aababbbabaabbbabababaaab
aaabbaabbbbbbabbbaabaaab
baabaaabaabbaaaaaabbbbbaaaaaaaabaaababaaabbabbbbaaaabbaabaaabaabbabbbaaa
aaaaaabaaaaabbaaaabaaaab
abaabaaababbbbbabaabaaba
bbabbbabaababbbbaaabaaaaaabbbbbb
bbabaaaaaaaaaabababbbbbaabbaaaaaaababaaabababbabbbbaabbb
abbabaabaabbbaabbabaaaaa
bbbbbabaaababbbbbaaabbbabbbbabaaabbbaaabbbbabbabbabbaabbabaaaaaabbabbabbbbbbbabb
ababbbaaaabbbabaaaaaabaa
ababbbaabababbbbbaabaaaabbbbaabaabbabaaabbabaabaaaaabaaa
bbbabbbbbababbbaaaaaaabb
bbaabbbaabababbaabaabbaaaaaaaabaaabbbbaabaaabaaabbaababbbabaaaba
aaabbbbbbaabbababbbabbbbbaabbbababaaaaba
abbbabaaabaaaaaababbabba
baabbaabaababbaaaaaababb
bbbabbbaabaabbaaaabbabababababbbbbbabbaababaabaaabaaabab
bbaabbaaaabaaaaaabaabaaaababbbbaabbbaabb
aabaaabaaaabbaaaaabbabbb
bbaababbbabbaaaabbbbbaaabababaaaaaabbaababbaaabbabbbbbbbbaabaabbababbbbaabbbbbab
abbaababaaabbbbbababbabbbabbbaaababbbabbbbbbaabb
bbbababbabbabaaaabbbababbaabaaba
bbbbbabbababbbaaabaabbaaababbabbaaabbbbbabaaaaba
babbaabbaaabababbbabaaab
aabbaabbabbbaababbababbabbbbaabbaaaaabab
aabbbaabbbbaaabbbbaaabaa
baabaaaabbaabbbbababbaaa
abbabbababbbabbabaababbb
bbababbbbaabbabaaaabbbaa
abbbaabaabbaabbbbaababab
bbbaaabbabbbaabaababbbbb
abababbaaaaaabbbbbbaabababbababb
bbbaaaaabbaabbbbbabaaaba
baabaaaabaabbaababbababa
babbbbababaabababaaabbaabbbabababbbabaaaabbaaaaaaaababbb
bbbbbbabbabbabaabbbbaabb
bbaaaababaabaaaaaaabbbabbbababaa
abaabaaabbbbbabaaaaabbaabbbaabaa
aabbbbabbabbbbabaabbbabbbabaabba
abbbbababbaabbaaabaabaab
abaabbbaaaababbbbbabaaba
babbbbaababbabaaaaaaaaab
baaabbbabbbbabaabbabababbabbaaabbbbbbaaaaaaabbbb
bbaabbaabaaabaaabbaaabbbabbbaabb
aababbaaabbbabaaabbabbaa
babbabaabaabbaaaababbbab
baaababbaabbababbbbabbaa
abbbabbbbabbaabbababbbba
baabbaaabbbaabbabbaaaaaa
abaabbaababbbababbbbabab
aaabbbababbbbababaababbbbbbabbaaabbaaabbabbbbbbb
bbbbbabaabbbababbabaabba
aabaaabaaabbaaaababbbaaabbaaaabaaabbabaa
bbaaaabbaabbaaaabaabaaba
ababbaabaaaaabbbbabbbbaaabbbabbaabbbaabaaabbbabaababbbbabbabbaaa
aababaababbaaabaaaaaaabaabbbabbaabbbbbbaaabbabbababbababaaabaaaaaaaaabbabababbba
ababaaabbbaabaabbbbbabab
bbbaaabbabbabaaaaaaababb
baabbaabbaabbaabbbababaa
abbabaaabbabbbbababbbaaabbbbbbbbabaabaab
babbbbababbabbbbbaabbbbbabbbabbaabbaabaaababaaaaaaabaabb
bbbbbabaabbbbbbabaabaaba
aabaaabaaaabbbabbaababaa
babbbabababbabbbaaaaaaababaaaaabbbaaababaaaabbba
babbaabbaaabaaabaabbaaba
aaabbaabbaabbbabaabaaaab
abbbbbbaabbaaaabaaabbbabbaaabbaa
abbbaabaabbbbbbaaaabbabb
bbbbbbbbbbbaaabbabbaaaba
abbbabbaaaababbbbaaabbaa
abbbbbabbbaaaabaaabababa
abaaaaaabaabbaaababbabbb
babababaabaabbbabbbbabab
ababbabbbbaabbaabbaaaaaa
bbbbaababbbaabababbbbaaa
baabbbbaabaabbbabbbbbbabaabbaabaabaabbbb
baabbbabaaabbaaaabbababa
abbbabbabbbbbabaabaaabab
bababbbbbabbbababbabaaba
baabbaababaaaababbbbbbbaabbbabbaabaaaababbbbbbab
baabbababbaabbbbababaaba
aaaaaababbaaabbbaabbabaa
bbababbbaaabbaabbabbabababaababa
aaaabbabbbbbaabaabbbbaaa
bbaabbbaaaabbaabbbaaabab
aaaabbbababbbaaabaaabbbbbaabbbbbbbababbaaaababbbabababba
abbbabbabbbbabbbaabaabababbbabababbbbabbbbaababa
bbabaaaaaabababbbabaaaaa
abbbbabbbbbbbaaabbaaaaaa
baaaaabbbbaabbbbabaaabba
aabbbababbbaababaabaabba
babbabaabbbabababbabbbaaabababab
babababaaabbbabaaabaabbbaaaabbbb
abbbbabaabbbbbabaabbbbbb
baaaaabbaaabbbabbabaabaa
abbbbbbaaabbababbabaabaa
abaabbbaabbbaababababbab
aaabababbbaaaabbabaaabaa
aabbaaaababbbaabababaaba
bbbabbababababbbabaababb
ababbbaabbbbbabbbabbbbabaabababbabaaabbb
bbbabbbabaabbabbabbaaaba
bbabababbaabbaabaaabaaaa
aabbbaababaabaaaaabaabbb
bbbbbabbbaabbaababaaabbb
aababbaaaabaababaaaaaabaaaabaabbaaaaabaa
bbbbabbbabbbababaabababa
babaaaababbbbabbaabaaaab
abaaaabaaabbabbaaabbbaaaababbbbabbbbbbaabbaababa
babbabaababaaabbbbabbaba
baabbabaaaabaaababaababa
bbbbbbbbbaabbabbbbaababa
aaabababbbbabbabbbaaaaab
abbbbbbabbbaababbaabbaaabaabbabbabaababbaabbbaaa
baabbaabbabababaabbbbaab
bbabaabbbaaaaabbaaabaaababababaabbabaaab
abbabaabbbbabaaaabaaaaab
bababaaabbbbaabaabbaaabaaaaabbbaabaaaaba
bbababbbbbbbbabbaaababaa
aababaaababaabbbbabaababbaabaaba
ababbbaabbbabbabaabbbbba
abbbbbbaabbaaaabbbabaaab
aabbabababbabaababbaaaba
aaaabbaaababbabbaababbbb
bbabbbbaabbbababababbbba
babbbbabbabbaaaabbaabbab
baabbaabbabaabbbbbbbabab
abbbbbbabaaabbabbaaaababbabaabbb
ababaabbabbabbbbbbaababb
bbaaaabbbbbabbbaaaaabbbb
baaaaabbaaababbbaabaaaaabbaababaababbaaa
bbabbbababbbaaaababbaaaaababaaba
bbbbbbabbbaabbbaaaabbbaa
bbaabbabbbaabaaabbababaabbabbabaaaaaababaabbabaa
abbbbbbaababaabbbabaaaaa
aaabbaabbbbbbbbbbaabaaaaaaababba
aaaaaabaababaabbababbbba
babbbaaaabbaaaabbaabaabb
abababbabaabbaababaababa
aababbbaaabaaaaabbbbabaabbaabbab
abbbaabaaabbbbabbbabaaba
babbbbbaababbabaabaaabaa
abbabbbbbbaabbbabbaabbaaaaabababbbaaabbaaabbbbbb
babbbbababaabbaaabbbbbbaabaaaabaababaaba
aabababbbaabbabbbbbbabaabbabbbaabbaaabaaabaaaabb
bbbababaababbbaaababbbab
aaabbbbabababababbbbbbaa
bbbbbaaabaabbaabbbaabbbabaabbbba
bbabbaabbbbbbababaabaabb
ababbabbbabbaaaaabbbbaab
bbbbbabaabababbbabaabbaaaabababbbaaaaaab
aaabbbbbbaaaaaaaabaaaaaabbababababaababaabaabbbbabbabbaa
bbaaabbbaabbbbaaaaabbaba
bbbaabbaaabbbabbbbaaaaaa
bbbabbbabbbbabbbbbaaaabaabbaaaaaaabaabbaabaaababaaabbbaa
baabbbbabaabbabbaabbaaaababaaaabbaababaa
bbbabbabbbaabbbaaaaabbabbbbbabbbbbbaaaab
abaaaaaaaabaabaabaaababa
bababaabbbbbbababbabaaba
aaaaaabaaabbbbabaababaaa
aabaabababbabbbbbaaaaaba
abbbbabbbbaabbabbabbabbabbabbaaabaabaaaabbaabaaaabbaaaaabbaaaabbbaabaaba
baabbabbababbabaaaaabaaa
aaaabbbaabbaaabbbbaaaaaa
baabbbbbaaaabbabaaabaaababbabbba
baabbabbbaabaaaabaabaaab
aaaaaaabbbbaaabbbbbbbbbababaaabaabbbaababaaaaababbababaa
abbbabbaabbabbbbbbabbaabaaabbbaabbbbaabbbabaabaabbbbbaab
aababaabbbbbbababbabababbababaabaaaababa
abaabbbaabbaabbbaaabbaabbababbbabbbbbbbaabbaaabbabbabbaabbababaaabaaaaba
aababaababbbabaaabbaaaaabaababbaababababbbaababbaaababaa
ababbabbbabbbaaaaabaabbbbaabbbbabaababba
ababaabbbabbaaabaaaababa
bbbabbbbaababaabaabaabba
abaabaaaabbaaaaaabbbaaab
aabaaaabaababaaaaaaabbbbbbbababbbbaabbab
babaaabbbbaabbbabababbbabbabbaabbbabbbbbabbbabbbabbaabbabbbabbaa
bbaaaabbbbabbabbaaaabbbb
baaaabbbabaabbbaaabaaaabbbababbaabaabbaaaababbaaabbbaabbaaabbbab
abbababbaaabbaabbabaabaabbbaababbaabaaabbaaaaaab
baabbbabbbbabbbabbabbbbbbbbabbbbbbbbaaab
abbabbababaabaaababaaaba
babbaaabbbabbbbbbbbaaaab
bbababbaaabbbabbabbaabababaaaabb
babbabababbbabbaababaabbbabbababababaabbabaaabbaabbbaaab
bbbabaabaaabbaabbbabbbababbbaabaabbabbba
bbaaaabaabababbabaaababa
aaaabbabaabbbbabbbaabaababababab
bbaaaababbbbaabaaaabbabaabaabbabaabbbbbbabaabaab
abbaaaabbaabbbabbaaababbabaaaaaaaabababbabaabbab
abbabbabaababaaaaaabbabb
bbbabbabbbaaaabaaaaaaabaabbabbaabaababbb
ababbaabaabababbbbbbaaaa
bbaabaabababbababbaabaaa
bbabaaaaabbbaaaabaabbbaa
ababaabaabbbaabbbaabbaaababaaababbaaaaabbaabbbabbbaabaababbbaaaabaabaaaaaaabaaaa
aabbbbaaababaabbabbbaabb
aabaaababbbbbababaabaaab
aaaaabbbbbaabbbabaabbbaa
aabababbabbabbabbabbbabaabbaaabb
abbaaaaabbaabaabbbbbaaab
baabbabaaaaabbabbaabaabb
bbabbbbbbabbbbbaababaaabaabbbbaaaaaaaaabbaaaaaba
bbbbabaaaababbaabbaabaababbaabbbbbaababa
baaaabbbaabbabaabbbaabbbababbabbaabaabaaababababbabaabbbabbababbaabaaabbaaaaaaaaabbbbbaaabaaabaa
aabbaabbaabbbababbbbabab
bbbbbabbaaaaaababababababaaababbaababbabaabaaabbabbababb
bbbabbbabbbaababaabbaaba
bbbaaaabbaabbabbbaabbbabbbabbbabbbabbbbaaabaaaabbbbababaababbbbbbaaabaaaaaaaaaab
bababaabbaabbbbaabbabbbbaabaaabb
bbaabbbabaabbbabaabababbabaabbbabaaaaabaaaaabaab
baabbbbabbabaaaabbaaaababbbbababbbbbaaab
ababbbaaabababaabbbbbabbbaaabbaa
bababbbbabbaabbbaabbaaba
abaabbaabaabbabbbabbbabb
abababbbababbababbbaabbb
abbbaabaababbaabbbaababa
baabbababaabbaabbbaaaaab
aabbababaaababbbbaaaaaab
baabbabbaabababbabbaaabb
aabbaaaabaabbaabbbbbbbba
abbabaabbaabbaaaaaaaaabaaaaaaaaa
abaabbbaabbabaaabbababaa
aaaabbaaaababbbaaabbabaa
babbaaaabbbbabaabbaaaaaa
ababaabbaaaaaababbaaaaaa
abbabbbbabbbbabbbbbbbbabbbbaabbb
bbaabaabbaabbaabaaabbbbbbabbbabb
bbaaaabaababaaabababaabbabaabaaaabaabbbabbaababa
bbbaaabbaabbaabbabaaaaab
aabbaaaabaabbbbabaaabbaa
abbbaabaaaaaaabaabaaabba
aaaabbbbabbaabaaabaaaaab
baaabaaabaaaaabbabbababb
babbbabaaabaabbbababbaaa
abbabbabbbaabbbaabbaabbbbababaababaaaaababbaaaba
aabaaabbaabaabbababaabbbbbbabbbbabbbaabbaabbbbabbaaaabaa
bbababbabbabababbabaabba
aaabababbaabbbbbbabaabaa
aabaabbbbaaabbbaaaaaabbbbaaaaabbaababbbabbbaabaa
bbbbabaabbbaaabbbbbabbbbbbbbbbbbaababbbb
abababaaabababbbaaaabbba
bbababbabaaabaaabaababab
abaabbbabbabbabbbbbbbbba
abaabbbabaaaabbaaaaabababbbaaaab
bbaabbbaaaababbbaabaabba
baaababbbbbbabaababbbbaaaabaabaabbaaaabbbbaabababaabaaabbabaaaaaabbaaaba
baaabbabbaabbaaaabbbabaaabaaababbababbab
abbaababbabbabaabbbbbabbbabbbaabaabaaabaabaaabbaabaaabbbabbababbabaaaaab
ababbabbaaaaababbbbaaaab
aabaabbbbbbabbbaaaabaaaa
aabbbabbbbabbaabbabbabba
bbbbbbabaaabababbbbaaaaaaabbabaa
aaaaaababbaaaabaaabbbabbbabbbaaabaaabbabbbabaaab
bbabbabbaabbaabbbaabbbbbaabababbbabbbbaaabaabbbaababbbbbbabaaababaaaabba
baaabbbbbbbabbababaaabaa
aabbababbbbbbabaaaaabbbb
babbaaaaaababbbaaaabaaba
aabbbbababaaabbbabaaaabb
aabbaabaabaaabbbaaaabaaa
babbbbabaabbbabbababaaaa".split("\n")
end

def short_rules
"42: 9 14 | 10 1
9: 14 27 | 1 26
10: 23 14 | 28 1
1: a
11: 42 31
5: 1 14 | 15 1
19: 14 1 | 14 14
12: 24 14 | 19 1
16: 15 1 | 14 14
31: 14 17 | 1 13
6: 14 14 | 1 14
2: 1 24 | 14 4
0: 8 11
13: 14 3 | 1 12
15: 1 | 14
17: 14 2 | 1 7
23: 25 1 | 22 14
28: 16 1
4: 1 1
20: 14 14 | 1 15
3: 5 14 | 16 1
27: 1 6 | 14 18
14: b
21: 14 1 | 1 14
25: 1 1 | 1 14
22: 14 14
8: 42
26: 14 22 | 1 20
18: 15 15
7: 14 5 | 1 21
24: 14 1".split("\n").inject({}) { |h, b| h[b.split(':')[0]] = "#{b.split(':')[1]} "; h }
end

def short_inputs
"abbbbbabbbaaaababbaabbbbabababbbabbbbbbabaaaa
bbabbbbaabaabba
babbbbaabbbbbabbbbbbaabaaabaaa
aaabbbbbbaaaabaababaabababbabaaabbababababaaa
bbbbbbbaaaabbbbaaabbabaaa
bbbababbbbaaaaaaaabbababaaababaabab
ababaaaaaabaaab
ababaaaaabbbaba
baabbaaaabbaaaababbaababb
abbbbabbbbaaaababbbbbbaaaababb
aaaaabbaabaaaaababaa
aaaabbaaaabbaaa
aaaabbaabbaaaaaaabbbabbbaaabbaabaaa
babaaabbbaaabaababbaabababaaab
aabbbbbaabbbaaaaaabbbbbababaaaaabbaaabba".split("\n")
end

ruleset = rules
while(ruleset.values.any? { |b| b.match(/[0-9]/) }) do
  found_key = ruleset.keys.detect { |key| !ruleset[key].match(/[0-9]/) }
  found_value = " (#{ruleset[found_key]}) "
  replace_key = " #{found_key} "
  ruleset.each do |key, value|
    value.gsub!(replace_key, found_value)
    value.gsub!(replace_key, found_value)
  end
  ruleset.delete(found_key)
end
rule_regex = Regexp.new("^#{ruleset["0"].gsub(/ /, '')}$")
puts "PART 1: #{inputs.map { |input| !input.match(rule_regex).nil? ? 1 : 0 }.sum}"

ruleset = rules #short_rules
%w(0 11 8).each { |i| ruleset.delete(i) }
saved_42 = ""
while(ruleset.values.any? { |b| b.match(/[0-9]/) }) do
  found_key = ruleset.keys.detect { |key| !ruleset[key].match(/[0-9]/) } || ''
  found_value = " (#{ruleset[found_key]}) "
  replace_key = " #{found_key} "
  ruleset.each do |key, value|
    value.gsub!(replace_key, found_value)
    value.gsub!(replace_key, found_value)
  end
  saved_42 = ruleset["42"].gsub(/ /, '') if found_key == "42"
  ruleset.delete(found_key)
end

# Translating rules to regexps
rule_8 = "(#{saved_42})+"
rule_11 = "(?<e>(#{saved_42})\\g<e>*(#{ruleset["31"].gsub(/ /, '')}))+"
ruleset_0 = "^(#{rule_8})(#{rule_11})$"

rule_regex = Regexp.new(ruleset_0)
puts "PART 2: #{inputs.count { |input| !input.match(rule_regex).nil? }}"
