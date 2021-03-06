source $POOP_PATH/poop.sh
require test/unit/test_case

class StringTest ${Test_Unit_TestCase}

function StringTest.test_single_word {
  local s=$(new String hello)
  @t assert_identical hello $(@x $s value)
}

function StringTest.test_multiple_words {
  local s=$(new String hello world)
  @t assert_identical "hello world" "$(@x $s value)"
}

function StringTest.test_multiple_spaces {
  local s=$(new String "  hello   world ")
  @t assert_identical "  hello   world " "$(@x $s value)"
}

function StringTest.test_equals {
  local s=$(new String hello)
  local t=$(new String hello)
  local u=$(new String hello world)
  
  @t assert_equal $s $s
  @t assert_equal $s $t
  @t deny $(@x $s equals $u)
}

run_tests StringTest
