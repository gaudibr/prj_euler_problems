MONTHS = {1 => ["January", 31], 2 => ["February", 28], 3 => ["March", 31], 4 => ["April", 30], 5 => ["May", 31], 6 => ["June", 30], 7 => ["July", 31], 8 => ["August", 31], 9 => ["September", 30], 10 => ["October", 31], 11 => ["November", 30], 12 => ["December", 31]}
DAY_OF_WEEK = {1=>"Monday",2=>"Tuesday",3=>"Wednesday",4=>"Thursday",5=>"Friday",6=>"Saturday",0=>"Sunday"}

def calendar(d,m,y)
	year = 1900
	month = 1
	day = 1
	day_of_week = 1

	day_count = 1
	
	coincide_count = 0

	puts MONTHS[month][0].to_s + " " + day.to_s + getSuffixForDay(day) + " " + year.to_s + " was a " + DAY_OF_WEEK[day_of_week].to_s

	while year < 2001
		if year>=1901 && day==1 && day_of_week==0
			coincide_count+=1
		end

		day_count += 1
		day += 1

		day_of_week = day_count%7

		leap_year = 0

		if month == 2 && (((year%4)==0 && (year%100)!=0) || (year%400)==0)
			leap_year = 1
		end


		if day > MONTHS[month][1]+leap_year
			day = 1
			month += 1
			if month > 12
				month = 1
				year += 1
			end
		end

		if day==d && month==m && year==y
			puts MONTHS[month][0].to_s + " " + day.to_s + getSuffixForDay(day) + " " + year.to_s + " was a " + DAY_OF_WEEK[day_of_week].to_s
		end
	end

	return coincide_count
end

def getSuffixForDay(n)
	if n == 1
		return "st"
	elsif n == 2 
		return "nd"
	elsif n == 3
		return "rd"
	else
		return "th"
	end
end