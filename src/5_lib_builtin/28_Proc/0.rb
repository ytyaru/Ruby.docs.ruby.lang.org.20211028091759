#!/usr/bin/env ruby

var = 1
$foo = Proc.new { var }
var = 2
def foo
  $foo.call
end
p foo       # => 2

def foo
  f = Proc.new{
    next 1
    2
  }
end
p foo().call       #=> 1

=begin
def foo
  f = Proc.new{
    return 1 # unexpected return (LocalJumpError)
    2
  }
end
p foo().call       #=> 1
=end

b1 = Proc.new{|a,b,c|
  p a,b,c
}
b1.call(2, 4) # 2 4 nil

=begin
b2 = lambda{|a,b,c|
  p a,b,c
}
b2.call(2, 4) # wrong number of arguments (given 2, expected 3)
=end

=begin
def foo
  Proc.new { return } # unexpected return (LocalJumpError)
end
foo.call
=end
def foo
  lambda { return }
end
p foo.call # nil
def foo
  lambda { return 1 }
end
p foo.call # 1

p lambda{}.lambda?   # => true
p ->{}.lambda?       # => true
p proc{}.lambda?     # => false
p Proc.new{}.lambda? # => false
def n(&b) b.lambda? end
p n {}               # => false

l = ->{3}
p l
p l[]
l = ->x{x+1}
p l[3]
#p l[] # wrong number of arguments (given 0, expected 1) (ArgumentError)
#p l[3,3] # wrong number of arguments (given 2, expected 1) (ArgumentError)

