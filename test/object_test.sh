source $FOOP_PATH/foop.sh
require test/unit/test_case

class ObjectTest ${Test_Unit_TestCase}

function ObjectTest.test_class {
  local o=$(new Object)
  @t assert_equal $Object $(@@ $o class)
}

function ObjectTest.test_clone {
  local o=$(new Object)
  __set_instance_variable $o testvar 10
  local p=$(@@ $o clone)
  @t assert_identical 10 $(__get_instance_variable $p testvar)
}

function ObjectTest.test_inspect {
  local o=$(new Object)
  local inspect=$(@@ $o inspect)
  @t assert_identical Object ${inspect:0:6}
}

function ObjectTest.test_equals {
  local o=$(new Object)
  local p=$(new Object)
  
  @t assert $(@@ $o "equals $o")
  @t deny $(@@ $o "equals $p")
}

function ObjectTest.test_equals_with_clone {
  local o=$(new Object)
  local p=$(@@ $o clone)
  
  @t assert $(@@ $o "equals $o")
  @t deny $(@@ $o "equals $p")
}

run_tests ObjectTest
