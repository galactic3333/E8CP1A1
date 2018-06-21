def method1(arg)
  file = File.open(arg, 'r')
  texto = file.read
  file.close

  palabras = texto.split(' ').map(&:strip)
  print palabras.length
end

method1('peliculas.txt')
