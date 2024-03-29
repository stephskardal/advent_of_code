require "./helpers"

data = read_input('fake.txt')

def do_math(line, maths, inputs)
  action, var1, var2 = line.split(' ')

  case action
  when 'inp'
    r = "#{var1}=#{inputs.shift}"
  when 'add'
    r = "#{var1}=(#{var1}+#{var2})"
  when 'mul'
    if var2 == 0.to_s
      r = "#{var1}=0"
    else
      r = "#{var1}=(#{var1}*#{var2})"
    end
  when 'div'
    r = "#{var1}=(#{var1}/#{var2})"
  when 'mod'
    r = "#{var1}=(#{var1}%#{var2})"
  when 'eql'
    r = "#{var1}=((#{var1}==#{var2})?1:0)"
  end

  maths << r
  return maths, inputs
end

# Building the maths
maths = []
inputs = 99999999999999.to_s.split('')
data.each do |line|
  maths, inputs = do_math(line, maths, inputs)
end
maths = maths.join(';').split('w=9;')
maths.shift
@maths = maths.map { |b| b.split(';') }

# Dedupping across the maths
non_matching = []
diffs = []
@maths[0].each_with_index do |m, index|
  non_matching << index if !@maths.all? { |inner_math| inner_math[index] == m }
end
@maths.each do |m|
  diffs << non_matching.map { |nm_i| m[nm_i].match(/[-0-9]+/).to_s.to_i }
end

# And, you lost me
maxes = Array.new(14, 0)
mins = Array.new(14, 0)
q = []

@maths.each_with_index do |maths, a|
  if diffs[a][0] == 1
    q.push([a, diffs[a][2]])
  else
    b, y = q.pop
    delta = y + diffs[a][1]
    if delta < 0
      a, b, delta = b, a, -delta
    end
    maxes[a], maxes[b] = 9, 9 - delta
    mins[b], mins[a] = 1, 1 + delta
  end
end

p maxes.join('')
p mins.join('')

=begin
The Brute Force way

@maths = []
maths.each do |m|
  #m = m.gsub('x=0;x=(x+z);x=(x%26);z=(z/1);', 'x=z%26;').gsub('y=0;y=(y+25);y=(y*x);', 'y=25*x;')
  #m = m.gsub('x=0;x=(x+z);x=(x%26);z=(z/26);', 'x=z%26;z=(z/26);')
  #m = m.gsub('y=0;y=(y+w);', 'y=w;').gsub('y=25*x;y=(y+1);', 'y=25*x+1;')
  #m = m.gsub(/y=w;y=\(y\+([0-9])\);/) { |z| "y=(w+#{$1});" }
  #m = m.gsub('y=w;y=(y+5);y=(y*x);z=(z+y)', 'y=(w+5)*x;z=z+y;')
  #m = m.gsub(/y=\(w\+([0-9]+)\);y=\(y\*x\);z=\(z\+y\)/) { |z| "y=(w+#{$1})*x;z=(z+(w+#{$1})*x)" }
  #m = m.gsub('x=((x==w)?1:0);x=((x==0)?1:0);', 'x=((x==w)?0:1);')
  #m = m.gsub(/x=z%26;x=\(x\+([-0-9]+)\);x=\(\(x==w\)\?0:1\);/) { |z| "x=(((z%26+#{$1})==w)?0:1);" }
  @maths << m
end

yolo = 49917929935111
yolo = 49999999999999

while(true) do
  if !yolo.to_s.match(/0/)
    inputs = yolo.to_s.split('')
    x=0;y=0;z=0;w=0;
    @maths.each do |math|
      w = inputs.shift.to_i
      eval(math)
    end
    p "#{yolo} -#{z}"
    if z == 0
      p "#{yolo} - x#{x} - y#{y} - z#{z} - w#{w}"
      die
    end
  end
  yolo = yolo - 1
end
=end
