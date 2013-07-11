c = 0
for a in 1..500
  for b in (1..500).to_a.reverse
    next if b < a
    c = 1000 - a - b
    if c**2 == a**2 + b**2
      puts a*b*c
    end
  end
end
