letters = [0,"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
names_file = File.new("names.txt", "r")
lines = names_file.readlines
names = lines[0].split(",").map!{|e| e.gsub(/"/,'')}.sort!
scores = []
names.each do |name|
	v = name.split('').inject(0){|sum, letter| sum + letters.index(letter) }
	i = names.index(name)+1
	scores.push(i*v)
end
puts scores.reduce(:+)
