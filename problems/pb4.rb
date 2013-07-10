
def palindrome_product()
  arr = []
  for i in 100..999
    for k in 100..999
      if i!=k
        prod = i*k
        if prod.to_s == prod.to_s.reverse
          arr.push([i,k,prod])
        end
      end
    end
  end
  max = 0
  max_arr = []
  arr.each do |i|
    if i[2]>max
      max = i[2]
      max_arr = i
    end
  end
  return max_arr
end
      
      