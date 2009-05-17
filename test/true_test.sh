source $FOOP_PATH/foop.sh
require test/unit/test_case

class TrueTest ${Test_Unit_TestCase}

function TrueTest.test_truth {
  @t assert $true
}

function TrueTest.test_negation {
  @t assert_equal $false $(@@ $true not)
}

function TrueTest.test_double_negation {
  @t assert $(@@ $true not not)
}

run_tests TrueTest
