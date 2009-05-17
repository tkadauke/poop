function @g {
  __get_instance_variable $this $1
}

function @s {
  local name=$1; shift
  __set_instance_variable $this $name "$*"
}

function @o {
  __obj $*
}

function @c {
  local ref
  read ref
  __call $ref "$@"
}

function @t {
  @o $this | @c "$@"
}

function @@ {
  local obj=$1; shift
  while [ $# != 0 ]; do
    local param="$1"; shift
    obj=$(@o $obj | @c $param)
  done
  echo "$obj"
}
