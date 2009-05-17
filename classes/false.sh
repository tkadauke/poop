class False

function False.not {
  echo $true
}

function False.inspect {
  echo "false"
}

false=$(new False)
