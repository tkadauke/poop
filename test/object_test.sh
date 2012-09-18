source $FOOP_PATH/foop.sh
require test/unit/test_case

class ObjectTest ${Test_Unit_TestCase}

function ObjectTest.test_class {
  local o=$(new Object)
  @t assert_equal $Object $(@x $o class)
}

function ObjectTest.test_clone {
  local o=$(new Object)
  __set_instance_variable $o testvar 10
  local p=$(@x $o clone)
  @t assert_identical 10 $(__get_instance_variable $p testvar)
}

function ObjectTest.test_inspect {
  local o=$(new Object)
  local inspect=$(@x $o inspect)
  @t assert_identical Object ${inspect:0:6}
}

function ObjectTest.test_instance_variables {
  local o=$(new Object)
  __set_instance_variable $o testvar 10
  local v=$(@c $o instance_variables)
  @t assert_identical 1 $(@c $v count)
  @t assert_identical testvar $(@c $v get 0)
}

function ObjectTest.test_instance_variables_on_plain_object {
  local o=$(new Object)
  local v=$(@c $o instance_variables)
  @t assert_identical 0 $(@c $v count)
}

function ObjectTest.test_equals {
  local o=$(new Object)
  local p=$(new Object)
  
  @t assert $(@x $o equals $o)
  @t deny $(@x $o equals $p)
}

function ObjectTest.test_equals_with_clone {
  local o=$(new Object)
  local p=$(@x $o clone)
  
  @t assert $(@x $o equals $o)
  @t deny $(@x $o equals $p)
}

run_tests ObjectTest
