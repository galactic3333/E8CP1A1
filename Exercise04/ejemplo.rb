file = File.open('peliculas.txt', 'r')
data = file.readlines
file.close

b = data.each_slice(5)
print b

a = [ [1, 2, 3], [4, 5, 6]]

print a
print a[0]