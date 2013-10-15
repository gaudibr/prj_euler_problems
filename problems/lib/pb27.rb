def quadratic n, a, b
	return n**2 + a*n + b
end

def count_consecutive_primes a, b
	count = 0
	n = 0
	while quadratic( n, a, b).prime?
		n, count = n+1, count+1
	end
	return count
end

def count_streak n
	streak = 0
	max_i_j = []
	for i in -n..n
		for j in -n..n
			this_count = count_consecutive_primes(i, j)
			if this_count>streak
				streak = this_count
				max_i_j = [i,j] 
			end
		end
	end
	return [streak, max_i_j].flatten
end

a = count_streak(999)
puts a, a[1]*a[2]