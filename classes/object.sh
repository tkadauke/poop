function Object.initialize {
  nop
}

function Object.class {
  @g class
}

function Object.clone {
  __clone $this
}

function Object.instance_variables {
  local result=$(new Array)
  for I in $(ls $objects/$this); do
    if [ $I != class ] && [ $I != superclass ]; then
      @c $result push $I
    fi
  done
  echo $result
}

function Object.inspect {
  local class=$(@@ $this class name)
  /bin/echo -n "$class#<$this "
  local first=$true
  local vars=$(@t instance_variables)
  local c=$(@c $vars count)
  for ((i = 0; i < $c; i++)); do
    if [ $first != $true ]; then
      /bin/echo -n ", "
    fi
    
    local name=$(@c $vars get $i)
    local value=$(@g $name)
    
    if [ $(is_object $value) == $true ]; then
      value=$(@c $value inspect)
    fi
    /bin/echo -n "$name: $value"
    first=$false
  done
  /bin/echo -n ">"
}

function Object.equals {
  if [ "$this" == "$1" ]; then
    echo $true
  else
    echo $false
  fi
}
