source $FOOP_PATH/foop.sh
require test/unit/test_case
require array

class ArrayTest ${Test_Unit_TestCase}

function ArrayTest.test_initialize {
  local a=$(new Array)
  @t assert_identical 0 $(@x $a count)
}

function ArrayTest.test_set {
  local a=$(new Array)
  @x $a set 10 "hello"
  @t assert_identical "hello" $(@x $a get 10)
}

function ArrayTest.test_push {
  local a=$(new Array)
  @x $a push "hello"
  @t assert_identical "hello" $(@x $a get 1)
  @t assert_identical 1 $(@x $a count)
}

run_tests ArrayTest
