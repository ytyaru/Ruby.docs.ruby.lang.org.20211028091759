#!/usr/bin/env -S ruby

until false
  p 'UNTIL'
  break
end

count = 0
until 5 < count
  p "#{count}"
  count += 1
end

count = 0
until 5 < count
  p "#{count}"
  count += 1
  break if count == 2
end

count = 0
until 5 < count
  count += 1
  next if count == 2
  p "#{count}"
end



break until false

count = 0
count+=1 until 5 < count

class C
  def initialize; @count = 0; end
  def countup; @count += 1; end
  def break?; 5 < @count; end
  attr_reader :count
end
c = C.new
p c.count
c.countup until c.break?
p c.count

