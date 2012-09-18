class Array

function Array.initialize {
  @s count 0
}

function Array.push {
  local index=$(@g count)
  for I in "$@"; do
    @t set $index "$1"
    index=$(($index + 1))
  done
  @s count $index
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

function Array.first {
  @t get 0
}

function Array.last {
  @t get $(($(@t count) - 1))
}

function Array.pop {
  local val="$(@t last)"
  local new_count=$(($(@g count) - 1))
  @s count $new_count
  echo "$val"
}

function Array.inspect {
  local c=$(@g count)
  /bin/echo -n '['
  local first=$true
  for ((i = 0; i != $c; i++)); do
    if [ $first == $false ]; then
      /bin/echo -n ', '
    else
      first=$false
    fi

    local obj=$(@t get $i)
    if [ $(is_object $i) == $true ]; then
      @x $(@t get $i) inspect
    else
      /bin/echo -n $obj
    fi
  done
  /bin/echo -n ']'
}

function @[ {
  local result=$(new Array)
  for I in "$@"; do
    if [ "$I" != "]" ]; then
      @x $result push "$I"
    fi
  done
  echo $result
}
