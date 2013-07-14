a = [one,two,three,four,five,six,seven,eight,nine,ten]
b = [eleven,twelve,thirteen,fourteen,fifteen,sixteen,seventeen,eighteen,nineteen,twenty]
c = [ten,twenty,thrity,fourty,fifty,sixty,seventy,eighty,ninety]
d = [onehundred,twohundred,threehundred,fourhundred,fivehundred,sixhundred,sevenheundred,eighthundred,ninehundred,onethousand]
AND = "and"
H = "-"

sum = 0
for i in 1..1000
  if i<=10
    sum+=a[i-1].length
  elsif i>10<=20
    sum+=b[i-11].length
  elsif
    