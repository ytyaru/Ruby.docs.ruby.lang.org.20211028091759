#!/usr/bin/env ruby

#class a; end #=> class/module name must be CONSTANT

class A; end
class A::B; end
A.new
A::B.new

class C
  private
  class D; end
end
C.new
C::D.new

# private_constant は最初にシンボル定義しないと未定義エラーになる
#class E
#  private_constant :F #=> `private_constant': constant E::F not defined (NameError)
#  class F; end
#end

class E
  class F; end
  private_constant :F
end
E.new
#E::F.new #=> private constant E::F referenced (NameError)

def m(*args, p1, p2); end

def m(*args, p1, p2)
  p args
  p p1
  p p2
end
m 1,2,3
m 1,2,3,4,5
#m 1

def m(p1, p2, *args, p3, p4)
  p p1
  p p2
  p args
  p p3
  p p4
end
m 1,2,3,4,5     #=> [1] 2 3
m 1,2,3,4,5,6 #=> [1,2,3] 4 5
m 1,2,3,4 #=> 1 2 [] 3 4

def f(a, b, c, m = 1, n = 1, *rest, x, y, z, k: 1, **kwrest, &blk)
  puts "a: %p" % a
  puts "b: %p" % b
  puts "c: %p" % c
  puts "m: %p" % m
  puts "n: %p" % n
  puts "rest: %p" % rest
  puts "x: %p" % x
  puts "y: %p" % y
  puts "z: %p" % z
  puts "k: %p" % k
  puts "kwrest: %p" % kwrest
  puts "blk: %p" % blk
end
f("a", "b", "c", 2, 3, "foo", "bar", "baz", "x", "y", "z", k: 42, u: "unknown") { }

[1,nil].each {|i| p i&.to_s}
[1,nil].each {p _1&.to_s}

def m(&block)
  block&.call 1, 2
end
m
m {|a,b| p '#{a} #{b}'}
#m proc {|a,b| p '#{a} #{b}'} #=> wrong number of arguments (given 1, expected 0) (ArgumentError)

def m(block = proc {})
  block&.call 1, 2
end
m
m {|a,b| p '#{a} #{b}'}
m proc {|a,b| p '#{a} #{b}'}


puts <<~FIRST, <<~SECOND
  最初
FIRST
  二番目
SECOND

=begin
def m(<<~FIRST) #=> syntax error, unexpected string literal, expecting ')'
  最初
FIRST
end
=end

=begin
def m(p1, <<FIRST, <<SECOND)
  最初
FIRST
  二番目
SECOND
  p FIRST
  p SECOND
end
=end

def m(p1, p2, ini=nil, fin=nil)
  ini&.call
  p "#{p1} #{p1}"
  fin&.call
end
m 1, 2
m 1, 2, proc{p '開始'}, proc{p '終了'}
m(1, 2) {p '開始'} # ブロックは実行されない
#m 1, 2 {p '開始'} #=> syntax error, unexpected '{', expecting end-of-input
#m 1, 2 {p '開始'} {p '終了'} #=> syntax error, unexpected '{', expecting end-of-input
#m 1, 2, {p '開始'}, {p '終了'} #=> syntax error, unexpected string literal, expecting `do' or '{' or '('

=begin
# ブロック引数はひとつだけしか定義できない！
def m(p1, p2, &ini=nil, &fin=nil) #=> syntax error, unexpected '=', expecting ')'
  ini&.call
  p "#{p1} #{p1}"
  fin&.call
end
=end

