#!/usr/bin/env ruby

var = 1
$foo = Proc.new { var }
var = 2
def foo
  $foo.call
end
p foo       # => 2

