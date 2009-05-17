class Array

function Array.initialize {
  @s count 0
}

function Array.push {
  local index=$(($(@g count) + 1))
  @s count $index
  @t set $index "$1"
}

function Array.set {
  local index="$1"
  local value="$2"
  
  @s "value${index}" "$value"
}

function Array.get {
  local index="$1"
  @g "value${index}"
}

function Array.count {
  @g count
}
