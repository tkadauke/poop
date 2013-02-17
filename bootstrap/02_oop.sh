function __new_ref {
  if [ "`which md5`" == "" ]; then
    head /dev/urandom | md5sum | cut -d\  -f 1
  else
    head /dev/urandom | md5
  fi
}

function __alloc {
  local class=$1
  local ref=$(__new_ref)
  mkdir $objects/$ref
  __set_instance_variable $ref __class ${!class}
  echo $ref
}

function __clone {
  local ref=$1
  local clone=$(__new_ref)
  cp -r $objects/$ref $objects/$clone
  echo $clone
}

function __is_object {
  local ref=$1
  [ -e $objects/$ref ]
}

function __obj {
  local ref=$1
  if __is_object $ref; then
    echo $ref
  else
    error "Tried to get '$ref' which is not an object reference"
  fi
}

function __set_instance_variable {
  local ref=$1
  local name=$2
  local value=$3
  echo "$value" > $objects/$ref/$name
}

function __get_instance_variable {
  local ref=$1
  local name=$2
  cat $objects/$ref/$name
}

function __class_of {
  __get_instance_variable $1 __class
}

function __call {
  local obj=$1; shift
  local fun=$1; shift
  
  if __is_object $obj; then
    __super_call $obj "$(__class_of "$obj")" $fun "$@"
  else
    error "Tried to call method $fun on something that is not an object: '$obj'"
  fi
}

function __super_call {
  local obj=$1; shift
  local cls=$1; shift
  local fun=$1; shift
  
  local class_name=$(__get_instance_variable "$cls" __name)
  local full_name="${class_name}.${fun}"
  
  if function_exists "$full_name"; then
    local before_this=$this
    this="$obj"
    $full_name "$@"
    this=$before_this
  else
    super=$(__get_instance_variable "$cls" __superclass)
    if [ "$super" == "" ]; then
      error "method $fun does not exist in class $class_name"
    else
      __super_call $obj $super $fun "$@"
    fi
  fi
}
