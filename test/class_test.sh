source $FOOP_PATH/foop.sh
require test/unit/test_case

class ClassTest ${Test_Unit_TestCase}

function ClassTest.test_class {
  class Something
  @t assert $(is_object $Something)
}

function ClassTest.test_default_superclass {
  class SomethingElse
  @t assert $(is_object $SomethingElse)
  @t assert_equal $Object $(@@ $SomethingElse superclass)
}

function ClassTest.test_custom_superclass {
  class SomeBase
  class SomeDerived $SomeBase
  
  @t assert_equal $SomeBase $(@@ $SomeDerived superclass)
}

function ClassTest.test_name {
  class NamedClass
  
  @t assert_identical NamedClass $(@@ $NamedClass name)
}

run_tests ClassTest
