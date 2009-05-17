source $FOOP_PATH/foop.sh
require test/unit/test_case

class FalseTest ${Test_Unit_TestCase}

function FalseTest.test_false {
  @t deny $false
}

function FalseTest.test_negation {
  @t assert $(@x $false not)
}

run_tests FalseTest
