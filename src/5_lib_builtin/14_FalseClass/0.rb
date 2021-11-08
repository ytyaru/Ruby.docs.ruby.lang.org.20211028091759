#!/usr/bin/env ruby

p true & true   #=> true
p true & false  #=> false
p false & false #=> true
p true | true   #=> true
p true | false  #=> true
p false | false #=> false
p ^true  #=> true
p ^false #=> false

p nil.nil? #=> true
