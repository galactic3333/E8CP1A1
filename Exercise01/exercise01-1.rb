def method1_1(string1, string2)
  file = File.open('index.html', 'w')
  file.puts "<p>#{string1}</p>"
  file.puts "<p>#{string2}</p>"
  file.close
end

puts 'Ingresa el primer string'
st1 = gets.chomp

puts 'Ingresa el segundo string'
st2 = gets.chomp

method1_1(st1, st2)
