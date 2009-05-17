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
  @t assert_identical "hello" $(@x $a get 0)
  @t assert_identical 1 $(@x $a count)
}

function ArrayTest.test_first {
  local a=$(new Array)
  @x $a push "hello"
  @x $a push "world"
  @t assert_identical "hello" $(@x $a first)
}

function ArrayTest.test_last {
  local a=$(new Array)
  @x $a push "hello"
  @x $a push "world"
  @t assert_identical "world" $(@x $a last)
}

function ArrayTest.test_pop {
  local a=$(new Array)
  @x $a push "hello"
  @x $a push "world"
  @t assert_identical "world" $(@x $a pop)
  @t assert_identical 1 $(@x $a count)
}

function ArrayTest.test_inspect {
  local a=$(new Array)
  @x $a push "hello"
  @x $a push "world"
  @t assert_identical "[hello, world]" "$(@x $a inspect)"
}

function ArrayTest.test_shortcut {
  local a=$(@[ hello world ])
  @t assert_identical 2 $(@x $a count)
  @t assert_identical "hello" $(@x $a first)
  @t assert_identical "world" $(@x $a last)
}

run_tests ArrayTest
