def factorial(n)
  if (n < 2)
    n
  else
    n * factorial(n - 1)
  end
end

def sum_of_digits n
  n.to_s.split('').inject(0) {|sum, i| sum + i.to_i}
end

puts sum_of_digits(factorial(100))