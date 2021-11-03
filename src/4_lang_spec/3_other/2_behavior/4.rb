#!/usr/bin/env ruby

def foo
 f = Proc.new { return :foo }
 f.call 
 return 
end

def bar
 f = lambda { return :bar }
 f.call 
 return 
end

def h
 yield
end

def hoge
 h{ return :hoge }
 nil
end

p foo()  #=> :foo
p bar()  #=> nil
p hoge() #=> :hoge

