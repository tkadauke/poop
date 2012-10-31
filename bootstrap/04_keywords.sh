function is_object {
  if __is_object $1; then
    echo $true
  else
    echo $false
  fi
}

function class {
  local name=$1
  local superclass=$(oror $2 $Object)
  local result=$(new Class $name $superclass)
  eval $name=$result
}

function new {
  local class=$1; shift
  local ref=$(__alloc $class)
  if [ $(is_object $ref) == $true ]; then
    __call $ref initialize "$@"
  else
    error "Could not allocate object of type '$class', ref '$ref'. Maybe it's not a class or not required?"
  fi
  echo $ref
}

function require {
  source $POOP_PATH/classes/$1.sh
}
