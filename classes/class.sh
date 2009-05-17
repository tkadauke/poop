function Class.initialize {
  @s name $1
  @s superclass $2
}

function Class.name {
  @g name
}

function Class.superclass {
  @g superclass
}
