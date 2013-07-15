a = ["one","two","three","four","five","six","seven","eight","nine","ten"]
b = ["eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen","twenty"]
c = ["ten","twenty","thrity","fourty","fifty","sixty","seventy","eighty","ninety"]
d = ["onehundred","twohundred","threehundred","fourhundred","fivehundred","sixhundred","sevenheundred","eighthundred","ninehundred","onethousand"]
AND = "and"
H = "-"

sum = 0
for i in 1..1000
  unit = i%10
  decimal = (((i-unit)/10)%10)%10
  cent = (i-unit-decimal)/100
  if i<=10
    sum += a[i-1].length
    puts a[i-1]
  elsif i > 10 && i <=20
    sum += b[i-11].length
    puts b[i-11]
  elsif i>20 && i<100
    unit = i%10
    decimal = (i-unit)/10
    unit == 0 ? word = c[decimal-1] : word = c[decimal-1]+H+a[unit-1]
    sum += word.length
    
  end
end
    