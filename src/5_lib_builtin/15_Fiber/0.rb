#!/usr/bin/env ruby

f = Fiber.new do
  raise StandardError, "hoge"
end
begin
  f.resume     # ここでも StandardError が発生する。
rescue => e
  p e.message  #=> "hoge"
end

f = Fiber.new do
  n = 0
  loop do
    Fiber.yield(n)
    n += 1
  end
end
5.times do
 p f.resume
end

def enum2gen(enum)
  Fiber.new do
    enum.each{|i|
      Fiber.yield(i)
    }
  end
end
g = enum2gen(1..100)
p g.resume  #=> 1
p g.resume  #=> 2
p g.resume  #=> 3

=begin
f = nil
Thread.new do
  f = Fiber.new{}
end.join
f.resume #=> t.rb:5:in `resume': fiber called across threads (FiberError)
=end

a = nil
f = Fiber.new do |obj|
  a = obj
  :hoge
end
b = f.resume(:foo)
p a  #=> :foo
p b  #=> :hoge


a = nil
f = Fiber.new do
  a = Fiber.yield()
end
f.resume()
f.resume(:foo)
p a  #=> :foo

f = Fiber.new { Fiber.yield }
f.resume
#f.raise "Error!" # => Error! (RuntimeError)

f = Fiber.new do
  loop do
    Fiber.yield(:loop)
  end
  :exit
end
p f.resume              # => :loop
p f.raise StopIteration # => :exit

f = Fiber.new do
  Fiber.yield(:hoge)
  :fuga
end
p f.resume() #=> :hoge
p f.resume() #=> :fuga
#p f.resume() #=> FiberError: dead fiber called
