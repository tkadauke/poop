# POOP - Persistent Object Oriented Programming

POOP is a proof of concept implementation of OOP in bash. Objects are represented as directories in the file system; instance variables are files inside these directories. This OOP implementation is *horribly* slow, but it works, and it even contains test cases.

## How it works

Because of the way bash functions work internally (when you call them, bash forks itself), bash variables can not be used for data storage. In particular, you can not set a variable inside of a function and expect it to be set after the function finished. This is why objects are persisted in the file system.

Functions return their values via stdout. That way, they can be called with the $() construct and the result can be stored in variables. All the OOP-related operators return their values via stdout, including object references. Some operators, like the @c operator, expect object references via stdin. If you want to output text, use stderr, or simply use the function "puts".

This is just a very brief explanation of things. To dig deeper, please refer to the source code.

### Classes

To define a class "Foo", simply write

    class Foo

### Methods

Methods are simple bash functions, with the class name and method name, separated by a dot:

    function Foo.bar() {
      echo "Hello"
    }

### Instances

To instanciate a class, use the new operator and store the result in a shell variable:

    obj=$(new Foo)

To access the current reference, use the variable $this.

### Method calls

In general, a method is called by piping the object reference into the call operator, like so:

    obj=$(new Foo)
    @o $obj | @c bar

Append parameters as needed.

#### Shortcuts

There are a couple of short cuts for different kinds of method calls:

This-call. To call a method of the same object, use the operator @t inside a method:

    function Foo.bar() {
      @t bar
    }

Object method call. To call a method on an object from the outside, use the @x operator:

    obj=$(new Foo)
    @x $obj bar

Train wrecks. To use call chains, use the @@ operator. Note that you can not pass any parameters to the methods in this case.

    obj=$(new Foo)
    echo $(@@ $obj class name)

### Instance variables

You can get and set instance variables with the get and set operators, like this:

    function Foo.bar() {
      @s var 10
      echo $(@g var)
    }

## Predefined classes

The implementation and the class hierarchy of POOP is very much inspired by the Ruby language. In the following short documentation, I will mention the methods defined in the respective class. Refer to the Ruby documentation for their meaning. If there are differences, I will mention them here.

### Class

* name
* superclass

### Object

* class
* clone
* instance_variables
* inspect
* equals

### True / False

$true is the only instance of class True, $false is the only instance of class False.

* not - Returns $false for $true and $true for $false
* inspect

### String

* value - returns the contents of the String object as a bash string
* equals

### Array

* push
* set index value - sets the array element at index to value
* get index - returns the array element at index
* count
* first
* last
* pop
* inspect
* @[ - global function as a short cut to create arrays. Example: @[ 1 2 3 ] creates an array with the three elements 1, 2 and 3


### Test\_Unit\_TestCase

* setup - override for your own setup method
* teardown - override for your own teardown method
* assert expression message - if expression evaluates to false, fail with the optional message parameter
* deny - opposite of assert
* assert_equal - test equality using the equals method
* assert_identical - test equality using the == operator

## Running the tests

To run the tests, cd into the poop directory and run:

    export POOP_PATH=$PWD
    bash run_tests.sh

Now, you can be amazed at exactly how slow object oriented programming can be!
