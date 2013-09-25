def convertNumberToWord(n)
	a = ["one","two","three","four","five","six","seven","eight","nine","ten"]
	b = ["eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen","twenty"]
	c = ["ten","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
	d = ["onehundred","twohundred","threehundred","fourhundred","fivehundred","sixhundred","sevenhundred","eighthundred","ninehundred","onethousand"]
	and_word = "and"
	hyphen = "-"
 	
 	unit = n%10
	decimal = (((n-unit)/10)%10)%10
	cent = (n-unit-decimal)/100
	
	count = 0
	if n<=10
		word = a[n-1]
	elsif n > 10 && n <=20
		word = b[n-11]
	elsif n>20 && n<100
		unit == 0 ? word = c[decimal-1] : word = c[decimal-1]+a[unit-1]
	elsif n>=100 && n<1001
		word = d[cent-1]
		if unit>0 or decimal>0
			word+= and_word+convertNumberToWord(n-100*cent)
		end
	end
	return word
end

def sumLetterCount(n)
	sum = 0
	for i in 1..n
		sum += convertNumberToWord(i).length
	end
	return sum
end