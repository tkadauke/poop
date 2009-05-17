class String

function String.initialize {
  @s value "$*"
}

function String.value {
  @g value
}

function String.equals {
  if [ "$(@t value)" == "$(@x $1 value)" ]; then
    echo $true
  else
    echo $false
  fi
}
