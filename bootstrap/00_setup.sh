objects=/tmp/$$
mkdir -p $objects
trap "rm -rf $objects" EXIT
q=">/dev/null"
