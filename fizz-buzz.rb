n = gets.to_i

for i in 1..n do
  line = ''
  
  line += 'Fizz' if (i % 3) == 0
  
  line += 'Buzz' if (i % 5) == 0

  line += i.to_s if line.empty?

  line += "\n"

  puts line
end