source $FOOP_PATH/foop.sh

class Host

hostname="enter some hostname here, where you can connect to without a password"

function Host.initialize {
  @s hostname $1
}

function Host.execute {
  local result=$(ssh deploy@$(@g hostname) "$1")
  puts "$result"
}

function Host.ls {
  @t execute ls
}

function Host.ps {
  @t execute "ps aux"
}

s=$(new Host $hostname)
puts "current dir"
@@ $s ls

puts
puts "processes"
@@ $s ps
