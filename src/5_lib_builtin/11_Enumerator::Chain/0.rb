#!/usr/bin/env ruby

e = Enumerator::Chain.new(1..3, [4, 5])
p e.to_a #=> [1, 2, 3, 4, 5]
p e.size #=> 5
e.each {|v| p v}
