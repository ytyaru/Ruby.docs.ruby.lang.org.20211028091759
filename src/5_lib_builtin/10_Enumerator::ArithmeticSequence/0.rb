#!/usr/bin/env ruby

#p Enumerator::ArithmeticSequence.new
#Enumerator::ArithmeticSequence.each{|n| p n}
p 3.step(7)
p 3.step(7).class

s = 3.step(7)
p s.step  #=> 1
p s.begin #=> 3
p s.end   #=> 7
p s.first #=> 3
p s.last  #=> 7
p s.size  #=> 5


p 3.step(7,2) #=> (3.step(7,2))
p 3.step(7,2).class #=> Enumerator::ArithmeticSequence
s = 3.step(7,2)
p s.step  #=> 2
p s.begin #=> 3
p s.end   #=> 7
p s.first #=> 3
p s.last  #=> 7
p s.size  #=> 3
