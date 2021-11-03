#!/usr/bin/env ruby

def foo
  f = Proc.new{
    next 1
    2
  }
end

p foo().call       #=> 1
def foo
  f = Proc.new{
    next 1
    2
  }
end

p foo().call       #=> 1
