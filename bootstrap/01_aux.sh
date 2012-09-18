function function_exists {
  declare -f $1 > /dev/null
}

function oror {
  if [ "$1" == "" ]; then
    echo "$2"
  else
    echo "$1"
  fi
}

function nop {
  $dont_do_anything
}

function debug {
  echo "***debug: " "$@" >&2
}

function puts {
  echo "$@" >&2
}

function print {
  /bin/echo -n "$@" >&2
}

function error {
  puts "error:" "$@"
  backtrace
}

function backtrace {
  puts "backtrace:"
  i=0
  while caller $i; do
    i=$((i+1))
  done >&2
}
