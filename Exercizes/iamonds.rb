
def diamond(int)
  stars = 1
  loop do 
    print_string(stars, int)
    break if stars == int
    stars +=2
  end

  loop do 
    stars -=2
    print_string(stars, int)
    break if stars == 1
  end
end

def print_string(stars, size)
  string = ''
  empty = (size - stars)/2
  empty.times { string += ' '}
  stars.times do |iter| 
    if iter == 0 || iter == stars - 1
      string += '*'
    else
      string += '*'
    end
  end

  puts string
end



def diamonds_one_line(int)
  (1-int..int).step(2).each{ |x| puts ('*' * (int - x.abs)).center(int)}
end

def diamonds_time(int)
  x = 1-int
  while x <= int
    puts ('*' * (int - x.abs)).center(int)
    x += 2
  end
end



def diamonds_empty_line(int)
  (1-int..int).step(2).each{ |x| puts (('*' + ' ' * (int - x.abs - 2) + '*')).center(int)}
end

diamonds_empty_line(20)


