source $FOOP_PATH/foop.sh

class Shape

function Shape.draw {
  puts "virtual!"
}

new Shape | @c draw

class Rectangle $Shape

function Rectangle.initialize {
  @s width $1
  @s height $2
}

function Rectangle.draw {
  puts "Rectangle with size $(@g width) x $(@g height)"
}

r=$(new Rectangle 10 15)
@@ $r draw
class_name=$(@@ $r class name)
puts "r's class name is $class_name"
puts "Cloning r into s"
s=$(@@ $r clone)
@o $s | @c draw
puts "s inspected:"
puts $(@o $s | @c inspect)
