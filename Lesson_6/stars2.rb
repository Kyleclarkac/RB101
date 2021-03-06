
def star(size)
  count = size * -1
  while count < size
    row = (size - count.abs)/2
    if row == (size - 1)/2
      puts('*' * size)
    else
      puts( (' ' * row) + '*' + ' ' * ((size - 3 - 2 * row)/2) + '*' + ' ' * ((size - 3 - 2 * row)/2) + '*')
    end
    count += 2
  end
end



star(7)

