def method1(arg)
  file = File.open(arg, 'r')
  movies = file.readlines
  file.close
  print movies.length
end

method1('peliculas.txt')
