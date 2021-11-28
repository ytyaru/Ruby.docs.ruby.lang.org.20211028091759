#!/usr/bin/env ruby
require 'date'

p Range.new 1, 5
p 1..5
p 1...5
p 'a'..'z'

#p Range.new # wrong number of arguments (given 0, expected 2..3) (ArgumentError)
#p ..  # syntax error, unexpected ...
#p ... # wrong number of arguments (given 0, expected 2..3) (ArgumentError)
p nil..nil

#(nil..nil).each{|i| p i} # can't iterate from NilClass (TypeError)


p (1..5).cover?(6)  # => false
p (1..5).cover?(5)  # => true
p (1...5).cover?(5) # => false

(3..5).each{ |i| p i }
(3...5).each{ |i| p i }

range = 1..10
range.first     # => 1
#range.first = 1 # => NoMethodError
p (1..10).frozen?
p (1..9).step(2) {|i| p i}

r = (1..9)
p r.begin
p r.first
p r.min
p r.end
p r.last
p r.max
p r.first 3
p r.min 3
p r.last 3
p r.max 3

p (1..9).size # 9
p (1..9).step(2).size # 9

p (1.1..2.3).include?(1.0)    # => false
p (1.1..2.3).include?(1.1)    # => true
p (1.1..2.3).include?(1.555)  # => true
p (1.1..2.3).cover?(1.0)      # => false
p (1.1..2.3).cover?(1.1)      # => true
p (1.1..2.3).cover?(1.555)    # => true
p ('b'..'d').include?('d')    # => true
p ('b'..'d').include?('ba')   # => false
p ('b'..'d').cover?('d')      # => true
p ('b'..'d').cover?('ba')     # => true
p (Date.today - 365 .. Date.today + 365).include?(Date.today)    #=> true
p (Date.today - 365 .. Date.today + 365).include?(DateTime.now)  #=> false
p (Date.today - 365 .. Date.today + 365).cover?(Date.today)      #=> true
p (Date.today - 365 .. Date.today + 365).cover?(DateTime.now)    #=> true
