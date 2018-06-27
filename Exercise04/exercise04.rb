puts "\n\tINVENTARIO DE PRODUCTOS"
puts "\n\tIngresa una opción:"
puts "1\tConocer la cantidad de productos existentes"
puts "2\tBuscar el stock total para un producto"
puts "3\tMostrar los productos no registrados en cada bodega"
puts "4\tConocer los productos con una existencia total menor a un valor ingresado"
puts "5\tRegistrar un nuevo producto con su respectivo stock en cada bodega"
puts "6\tSalir"
option = gets.chomp

while option != '6'

  def method1_1(arg)
    file = File.open(arg, 'r')
    productos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close
    # print productos
    soloprod = productos.map(&:shift)
    # print soloprod
    # print productos
    exisprod = productos.map { |li| li.inject(0) { |sum, x| sum + x.to_i } }
    soloprod.zip(exisprod).to_h.each do |key, value|
      puts "#{key}: #{value} unidades"
    end
  end

  def method1_2(arg)
    file = File.open(arg, 'r')
    productos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close
    # print productos
    soloprod = productos.map(&:shift)
    # print productos
    productosint = productos.map { |lista| lista.map(&:to_i) }
    # https://stackoverflow.com/questions/2682411/ruby-sum-corresponding-members-of-two-or-more-arrays
    # print productosint
    # print productosint.transpose
    prodtiend = productosint.transpose.map { |x| x.inject(:+) }
    puts "El stock de productos en cada tienda es: #{prodtiend}"
  end

  def method1_3(arg)
    file = File.open(arg, 'r')
    productos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close
    totprod = productos.map { |li| li.inject(0) { |sum, x| sum + x.to_i } }.inject(:+)
    puts "El stock total de productos en todas las tiendas es: #{totprod} unidades"
  end

  def method2(arg)
    puts 'Ingresa el nombre del producto para saber su existencia'
    nombre = gets.chomp
    file = File.open(arg, 'r')
    productos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close
    soloprod = productos.map(&:shift)
    exisprod = productos.map { |li| li.inject(0) { |sum, x| sum + x.to_i } }
    hash1 = soloprod.zip(exisprod).to_h
    # print hash1
    unless hash1.key?(nombre)
      puts 'El producto ingresado no existe en el inventario'
    end
    hash1.each do |key, value|
      if key == nombre
        puts "El #{key} tiene #{value} unidades"
      end
    end
  end

  def method3(arg)
    file = File.open(arg, 'r')
    productos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close
    tienda = productos.transpose
    soloprod = tienda.shift
    # print soloprod
    # print tienda
    # print tienda.length
    tienda1 = soloprod.zip(tienda[0]).to_h
    tienda1.each{ |key, value| print "El producto: #{key} no esta registrado en la tienda1" if value == 'NR' }
    tienda2 = soloprod.zip(tienda[1]).to_h
    tienda2.each{ |key, value| print "El producto: #{key} no esta registrado en la tienda2" if value == 'NR' }
    tienda3 = soloprod.zip(tienda[2]).to_h
    tienda3.each{ |key, value| print "El producto: #{key} no esta registrado en la tienda3" if value == 'NR' }
  end

  def method4(arg)
    puts 'Ingresar el valor límite:'
    lim = gets.chomp.to_i
    file = File.open(arg, 'r')
    productos = file.readlines.map(&:chomp).map { |w| w.split(', ') }
    file.close
    soloprod = productos.map(&:shift)
    exisprod = productos.map { |li| li.inject(0) { |sum, x| sum + x.to_i } }
    hashprod = soloprod.zip(exisprod).to_h
    hashprod.each{ |key, value| puts "#{key} tiene una existencia de #{value}, menor a #{lim}" if value < lim }
  end

  def method5(arg)
    puts 'Ingresa el nombre del producto y luego el stock de la tienda 1 a la 3'
    puts 'Separar los valores por coma + espacio'
    puts 'Ejemplo: Producto16, 25, 0, 12'
    newproduct = gets.chomp
    file = File.open(arg, 'a')
    file.print "\n#{newproduct}"
    file.close
  end

  case option

  when '1'
    puts 'Ingresa una opción'
    puts "1\tMostrar la existencia por productos"
    puts "2\tMostrar la existencia total por tienda"
    puts "3\tMostrar la existencia total en todas las tiendas"
    puts "4\tVolver al menu principal"
    option1 = gets.chomp

    case option1
    when '1'
      method1_1('productos.txt')
    when '2'
      method1_2('productos.txt')
    when '3'
      method1_3('productos.txt')
    when '4'

    end

  when '2'
    method2('productos.txt')
  when '3'
    method3('productos.txt')
  when '4'
    method4('productos.txt')
  when '5'
    method5('productos.txt')
  end

  validoption = ['1', '2', '3', '4', '5']

  if validoption.include?(option)
  else
    puts 'La opción ingresada no es válida!'
  end

  puts "\n\tINVENTARIO DE PRODUCTOS"
  puts "\n\tIngresa una opción:"
  puts "1\tConocer la cantidad de productos existentes"
  puts "2\tBuscar el stock total para un producto"
  puts "3\tMostrar los productos no registrados en cada bodega"
  puts "4\tConocer los productos con una existencia total menor a un valor ingresado"
  puts "5\tRegistrar un nuevo producto con su respectivo stock en cada bodega"
  puts "6\tSalir"
  option = gets.chomp

end
