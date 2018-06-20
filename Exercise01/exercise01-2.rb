def method1_2(string1, string2, array1)
  file = File.open('index2.html', 'w')
  file.puts "<p>#{string1}</p>"
  file.puts "<p>#{string2}</p>"
  if array1.length != 0
    file.puts '<ol> '
    array1.each { |x| file.puts "\t<li>#{x}</li>" }
    file.puts '</ol>'
  end
  file.close
end

puts 'Ingresa el primer string'
st1 = gets.chomp

puts 'Ingresa el segundo string'
st2 = gets.chomp

puts 'Ingresa los elementos del string separados por comas'
arr1 = gets.chomp.split(",").map { |ele| ele.strip }
method1_2(st1, st2, arr1)
