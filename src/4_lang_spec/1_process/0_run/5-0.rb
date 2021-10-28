#!/usr/bin/env -S ruby

for v in [1,3,5]
  p v
end

for v in 1..5
  p v
end

[1,2,3].each {|i| p i}

[1,2,3].each do |i|
  p i
end

['A','B','C'].each_with_index {|v,i| p "#{i}:#{v}"}

