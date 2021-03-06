def fib(int)
  if int == 2 || int == 1
    return 1
  else
    return fib(int - 1) + fib(int -2)
  end
end

puts fib(11)

#1, 1, 2, 3, 5, 8, 13, 


def fibby(int)
  return 1 if int < 3
  current = 1 
  previous = 1 
  fib = 0 

  (int - 2).times do 
    fib = current + previous
    previous = current
    current = fib
  end
  fib
end

puts fibby(1000).to_s[-1]