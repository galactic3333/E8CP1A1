def method1(arg)
  file = File.open(arg, 'r')
  movies = file.readlines
  file.close
  puts movies.length
end

method1('peliculas.txt')
