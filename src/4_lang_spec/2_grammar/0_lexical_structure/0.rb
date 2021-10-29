#!/usr/bin/env -S ruby
['A','B','C'].each {p _1}
['A','B','C'].each {|v| p v}

['A','B','C'].each_with_index {p "#{_2}:#{_1}"}
['A','B','C'].each_with_index {|v,i| p "#{i}:#{v}"}

['A','B','C'].each {|_| p _}
#['A','B','C'].each {p _} # undefined local variable or method `_' for main:Object (NameError)
