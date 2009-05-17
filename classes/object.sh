function Object.initialize {
  nop
}

function Object.class {
  @g class
}

function Object.clone {
  __clone $this
}

function Object.inspect {
  local class=$(@@ $this class name)
  /bin/echo -n "$class#<$this "
  local first=$true
  for I in $(cat $objects/$this | grep -v "^class="); do
    if [ $first != $true ]; then
      /bin/echo -n ", "
    fi
    
    local name=$(echo $I | sed -e "s/=.*$//")
    local value=$(echo $I | sed -e "s/^[a-zA-Z0-9_]*=//")
    
    if [ $(is_object $value) == $true ]; then
      value=$(@x $value inspect)
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
