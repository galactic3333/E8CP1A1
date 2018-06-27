def method1(arg, string1)
  file = File.open(arg, 'r')
  texto = file.read
  file.close

  palabras = texto.split(' ').map(&:strip)

  print palabras
  # Solucion correcta con each:
  # sum = 0
  # palabras.each { |x| sum += 1 if x == string1 }
  # print sum

  # numeros = palabras.inject(0) { |sum, x| sum + 1 if x == string1 }

  numeros = palabras.inject do |x, i|
    x += 1 if i == string1
    x.to_i
    
  end

  print numeros
end

puts 'Ingresa el string que deseas buscar en el archivo'
st1 = gets.chomp

method1('peliculas.txt', st1)
