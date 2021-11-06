#!/usr/bin/env ruby

eval 'p "A"'
binding.eval 'p "A"'

#binding.irb

p binding.local_variable_defined? :v #=> true
v = 1
p binding.local_variable_defined? :v #=> true
p binding.local_variable_defined? :x #=> false

v = 1
p binding.local_variable_get :v #=> 1

v = 1
p binding.local_variable_set :v, 2 #=> 2
p v #=> 2

p local_variables
p binding.receiver

p binding.source_location #=> ["/tmp/.../0.rb", 23]
p __FILE__
p __LINE__

