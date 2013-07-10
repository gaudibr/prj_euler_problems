def fibonacci(n)
  phi = (1+ Math.sqrt(5))/2
  return ((phi**n-(1-phi)**n)/Math.sqrt(5)).round
end

def firstkfib(k)
  i = 1
  arr = []
  until i == k+1 do
    arr.push(fibonacci(i))
    i+=1
  end
  return arr
end

def fibunderk(k)
  fib = 0
  arr = []
  i = 1
  while true
    fib = fibonacci(i)
    if fib < k
      arr.push(fib)
    else
      break
    end
    i+=1
  end
  return arr
end

def pairinarray(arr)
  b = arr.select {|x| x.even? }
  return b
end

def sumarray(arr)
  sum = 0
  for i in arr
    sum += i
  end
  return sum
end

a = fibunderk(4000000)
b = pairinarray(a)
sum = sumarray(b)
