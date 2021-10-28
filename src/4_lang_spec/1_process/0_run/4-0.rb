#!/usr/bin/env -S ruby

while true
  p 'WHILE'
  break
end

count = 0
while count < 5
  p "#{count}"
  count += 1
end

count = 0
while count < 5
  p "#{count}"
  count += 1
  break if count == 2
end

count = 0
while count < 5
  count += 1
  next if count == 2
  p "#{count}"
end


break while true

count = 0
count+=1 while count < 5

class C
  def initialize; @count = 0; end
  def countup; @count += 1; end
  def loop?; @count < 5; end
  attr_reader :count
end
c = C.new
p c.count
c.countup while c.loop?
p c.count













