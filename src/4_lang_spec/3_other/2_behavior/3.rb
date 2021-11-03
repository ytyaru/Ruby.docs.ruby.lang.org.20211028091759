#!/usr/bin/env ruby
b1 = Proc.new{|a,b,c|
  p a,b,c
}
b1.call(2, 4)

b2 = lambda{|a,b,c|
  p a,b,c
}
#b2.call(2, 4) # => wrong number of arguments (given 2, expected 3)

b1 = Proc.new{|a,b,c|
  p a,b,c
}
b1.call(2, 4)

b2 = lambda{|a,b,c|
  p a,b,c
}
#b2.call(2, 4) # => wrong number of arguments (given 2, expected 3)

