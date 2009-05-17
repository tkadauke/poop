source $FOOP_PATH/foop.sh

class Host

hostname="" # enter some hostname here, where you can connect to without a password
username="" # enter a user name here, or leave blank for default user

function Host.initialize {
  @s hostname $1
  @s username $(oror $2 $USER)
}

function Host.execute {
  local result=$(ssh $(@g username)@$(@g hostname) "$1")
  puts "$result"
}

function Host.ls {
  @t execute ls
}

function Host.ps {
  @t execute "ps aux"
}

s=$(new Host $hostname $username)
puts "current dir"
@@ $s ls

puts
puts "processes"
@@ $s ps
