#!/usr/bin/env ruby
weak_map = ObjectSpace::WeakMap.new
key = "text"
p key.object_id #=> 36
weak_map[key] = "test" # => test
p weak_map[key] # => test
p weak_map[key].object_id #=> 48
