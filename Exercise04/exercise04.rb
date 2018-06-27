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
    soloprod = productos.map(&:shift)
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
    no_attendance('alumnos.csv')
  when '3'

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