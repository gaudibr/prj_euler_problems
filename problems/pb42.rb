require 'benchmark'

def pb42
  letters = "-ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  words_file = File.new("words.txt", "r")
  lines = words_file.readlines
  words = lines[0].split(",").map!{|e| e.gsub(/"/,'')}
  max_value = words.max_by { |v| v.length}.length * letters.index("Z")

  def triangle_number(n)
    n*(n+1)/2
  end
  i,n = 1,0
  triangle_numbers = []
  begin
    triangle_numbers << n = triangle_number(i)
    i+=1
  end while n < max_value

  triangle_words = []
  words.each do |word|
    v = word.split('').inject(0){|sum, letter| sum + letters.index(letter) }
    triangle_words<< word if triangle_numbers.include? v
  end
  puts triangle_words.length
end

puts Benchmark.measure{pb42}