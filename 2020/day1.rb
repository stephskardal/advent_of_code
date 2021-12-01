# I didn't keep the script, but my code looked something like:

numbers.product(numbers).detect { |b| b[0] + b[1] == 2020 }.reduce(:*)
numbers.product(numbers, numbers).detect { |b| b[0] + b[1] + b[2] == 2020 }.reduce(:*)
