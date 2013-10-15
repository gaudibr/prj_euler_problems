require Prime

def critical_path(n)
  final_arr = []
  arr = (1..n).to_a


  begin
    final_arr.push(arr.pop)

    temp_arr = []
    for i in arr
      if final_arr.last % i == 0
        temp_arr.push(i)
      end
    end
    arr = arr - temp_arr
  end while arr.size > 0
  return final_arr
end

def smallest_multiple2(n)
  sm = 1
  for i in critical_path(n)
    sm*=i
  end
  return sm
end


def smallest_multiple3(n)
  factor_arr = []
  for i in 1..n
    prime_division = Prime.prime_division(i)
    prime_division.each do |prime|
      factor_arr.push(prime.first)
    end    
  end
  return factor_arr
end

def smallest_multiple(n)
  k = 1
  found = false
  while !found do
    rest_0 = true
    for i in 1..n
      if k % i != 0
        rest_0 = false
        break
      end
    end
    if rest_0
      found = true
    else
      k+=1
    end     
  end
  return k
end