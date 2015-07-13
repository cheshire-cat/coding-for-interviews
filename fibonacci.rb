def recursive_fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1
  return  recursive_fibonacci(n - 1) + recursive_fibonacci(n - 2)
end

def iterative_fibonacci(n)
  return 0 if n == 0
  return 1 if n == 1

  n_prev = 1
  n_prev_prev = 0
  
  (n - 1).times do
    n = n_prev + n_prev_prev
    n_prev_prev = n_prev
    n_prev = n
  end

  return n
end

p "#{iterative_fibonacci 11}"
p "#{recursive_fibonacci 11}"