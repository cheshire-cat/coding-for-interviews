n = gets.to_i

def f(n)
  (1..n).inject { |p, n| p * n}
end

def r_f(n)
  if n == 0
    1
  else
    n * r_f(n - 1)
  end
end

puts "iteration: #{n}! = #{f(n)}"
puts "recursion: #{n}! = #{r_f(n)}"
