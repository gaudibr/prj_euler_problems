require 'Prime'

k = 600851475143

def largest_prime_factor(k)
  factor_arr = []
  for factor in Prime.prime_division(k)
    factor_arr.push(factor.first)
  end
  
  return factor_arr.max
end
