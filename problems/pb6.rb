def sumarray(arr)
  sum = 0
  for i in arr
    sum += i
  end
  return sum
end

def square_difference(n)
  arr_sum_of_squares = []
  arr_sum = []
  for i in 1..n
    arr_sum_of_squares.push(i**2)
    arr_sum.push(i)
  end
  
  return sumarray(arr_sum)**2 - sumarray(arr_sum_of_squares)
end
  
puts square_difference(100)