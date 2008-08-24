array = ['A', 'B', 'C', 'D', 'E', 'F']

puts Time.now

n = 0

array.each do |a|
  array.each do |b|
    unless a == b
      n += 1
      puts a + b  
    end
  end
end

puts n

puts Time.now