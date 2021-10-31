#!/usr/bin/env ruby

x = if true
      1
    elsif true
      2
    else
      3
    end
p x

p x if true

$_ = 'ruby 3.0.2'
p 'regular1' if /[rR]uby[\s]\d(\.\d){0,2}/
p 'regular2' if $_ =~ /ruby/

x = unless false
      7
    else
      8
    end
p x

p x unless false

$age = 10
p case $age
when 0 .. 2
  "baby"
when 3 .. 6
  "little child"
when 7 .. 12
  "child"
when 13 .. 18
  "youth"
else
  "adult"
end

ary = [1,2,3]
p case 1
when *ary
  ary
end

p case 1
when 1,2,3
  ary
end

p case 1; when 1; 1; end;

ary = [0,2,4,8,16,32,64,128,256,512,1024]
i = 0
while i < ary.length
  p ary[i]
  i += 1
end

break while true
begin
  p 'do-while'
  break
end while true

until false
  break
end

break until false

begin
  p 'do until'
  break
end until false

for i in [1, 2, 3]
  p i*2
end
[1,2,3].each {|i| p i*2}
[1,2,3].each {p _1*2}

for i,j in [[1,2], [3,4], [5,6]]
  p [i,j]
end
for i in [[1,2], [3,4], [5,6]]
  p i
end
for i,j in [1, 2, 3]
  p [i,j]
end
class Array
  def each2
    i = 0
    while i < self.size
      yield self[i], self[i+1]
      i += 2
    end
  end
end
[1,2,3].each2 {|i,j| p [i, j]}


i = 0
while i < 3
  p i
  break
end

[1,2,3,4,5].each do |i|
  next if 0 == (i % 2)
  p i
end

count = 0
[1,2,3,4,5].each do |i|
  p i
  count += 1
  redo if count < 3
end

is_retry = false
begin
  p 'begin'
  raise unless is_retry
rescue
  p 'rescue'
  is_retry = true
  retry
end

=begin
def iter
  p 'iter 1'
  yield
  p 'iter 2'
end
iter { redo }
iter { next }
iter { break }
=end

begin
  p 'begin'
  raise
rescue => e
  p 'rescue'
  p $!
  p e
else
  p 'else'
ensure
  p 'ensure'
end

p 'rescue修飾子' rescue raise

def m
  return 5
end
p m

BEGIN { p 'BEGIN 1' }
BEGIN { p 'BEGIN 2' }
BEGIN { p 'BEGIN 3' }

END { p 'END 1' }
END { p 'END 2' }
END { p 'END 3' }

