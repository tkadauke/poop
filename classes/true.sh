class True

function True.not {
  echo $false
}

function True.inspect {
  echo "true"
}

true=$(new True)
