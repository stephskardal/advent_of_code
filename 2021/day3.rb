require "./helpers"

def to_decimal(binary)
  binary.reverse.chars.map.with_index do |digit, index|
    digit.to_i * 2**index
  end.sum
end

data = read_input

# Part 1
ts = data.map{ |b| b.split("") }.transpose

most = ""
less = ""
ts.each do |b|
  if b.count("0") > b.count("1")
    most = "#{most}0"
    less = "#{less}1"
  else
    most = "#{most}1"
    less = "#{less}0"
  end
end
p to_decimal(most)*to_decimal(less)

# Part 2
def runme
  ogen = ""
  c2 = ""

  data = read_input

  length = data.first.length - 1

  ts_winner = data.map { |b| b.split("") }
  ts_loser = data.map { |b| b.split("") }

  for v in 0..length do
    f_w = ts_winner.map{ |z| z[v] }
    winner = (f_w.size <= 1 || f_w.count("1") >= f_w.count("0")) ? "1" : "0"
    ogen = "#{ogen}#{winner}"
    ts_winner = ts_winner.select { |a| a[v] == winner }
  end

  for v in 0..length do
    f_l = ts_loser.map{ |z| z[v] }
    if f_l.size == 1
      loser = f_l[0]
    else
      loser = (f_l.size == 0 || f_l.count("1") >= f_l.count("0")) ? "0" : "1"
    end
    ts_loser = ts_loser.select { |a| a[v] == loser }
    c2 = "#{c2}#{loser}"
  end
  p to_decimal(ogen)*to_decimal(c2)
end

runme
