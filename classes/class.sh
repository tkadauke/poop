function Class.initialize {
  @s __name $1
  @s __superclass $2
}

function Class.name {
  @g __name
}

function Class.superclass {
  @g __superclass
}
