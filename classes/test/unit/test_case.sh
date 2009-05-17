class Test_Unit_TestCase

function Test_Unit_TestCase.initialize {
  @s failed $false
  @s assertions 0
  @s failures 0
}

function Test_Unit_TestCase.setup {
  nop
}

function Test_Unit_TestCase.teardown {
  nop
}

function Test_Unit_TestCase.run {
  @s testcase $1
  @t setup
  @t $1
  @t teardown
  @t result
}

function Test_Unit_TestCase.assert {
  local assertion=$1
  if [ "$assertion" == "$true" ]; then
    @t pass
  else
    local message=$(oror $2 "assertion failed: $(@x $1 inspect) is not true")
    @t fail "$message"
  fi
}

function Test_Unit_TestCase.deny {
  local assertion=$1
  if [ "$assertion" == "$false" ]; then
    @t pass
  else
    local message=$(oror $2 "assertion failed: $(@x $1 inspect) is not false")
    @t fail "$message"
  fi
}

function Test_Unit_TestCase.assert_equal {
  if [ "$(@o $1 | @c equals $2)" == "$true" ]; then
    @t pass
  else
    local message=$(oror $3 "assertion failed: $(@x $1 inspect) expected, but got $(@x $2 inspect)")
    @t fail "$message"
  fi
}

function Test_Unit_TestCase.assert_identical {
  if [ "$1" == "$2" ]; then
    @t pass
  else
    local default="assertion failed: '$1' expected, but got '$2'"
    local message="$(oror "$3" "$default")"
    @t fail "$message"
  fi
}

function Test_Unit_TestCase.pass {
  @s assertions $(($(@g assertions) + 1))
}

function Test_Unit_TestCase.fail {
  if [ $(is_object $1) == $true ]; then
    local message="$(@@ $1 value)"
  else
    local message="$1"
  fi
  local newline=$'\n'
  @s failed $true
  @s failures $(($(@g failures) + 1))
  puts $(@g testcase): "$message"
}

function Test_Unit_TestCase.result {
  if [ $(@g failed) == $true ]; then
    print 'F'
  else
    print '.'
  fi
}

function Test_Unit_TestCase.assertions {
  @g assertions
}

function Test_Unit_TestCase.failures {
  @g failures
}

function run_tests {
  local test_suite=$1
  local filename=$0
  local tests=$(cat $filename | grep "function $1.test_" | sed -e "s/function $1.//" | sed -e "s/{//")
  
  local test_count=0
  local assertions=0
  local failures=0
  for I in $tests; do
    local test=$(new $test_suite)
    @o $test | @c run $I $q
    assertions=$(($(@x $test assertions) + assertions))
    failures=$(($(@x $test failures) + failures))
    test_count=$((test_count + 1))
  done
  
  puts
  puts "$test_count tests, $assertions assertions, $failures failures"
}
