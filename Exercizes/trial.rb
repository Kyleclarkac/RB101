def diamond(number)
  base = []
  (1..number).step(2) { |step| base << ("*" * step).center(number) }
  p base[0..-2] + base.reverse
end

diamond(5)