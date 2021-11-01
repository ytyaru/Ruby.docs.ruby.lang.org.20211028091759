#!/usr/bin/env ruby

class A
  def m
    p n
    p self.n
  end
  private
  def n
    :n
  end
end
A.new.m

p self #=> main
def m
  p self #=> main
end
m

class A
  def self.class_method
    :class_method
  end
  def ins_method
    :ins_method
  end
end
A::class_method
A.class_method
#A::ins_method #=> undefined method `ins_method' for A:Class (NoMethodError)
#A.ins_method #=> undefined method `ins_method' for A:Class (NoMethodError)
#A.new::class_method #=> undefined method `class_method' for #<A:0x02094690> (NoMethodError)
#A.new.class_method #=> undefined method `class_method' for #<A:0x015846a8> (NoMethodError)
A.new::ins_method
A.new.ins_method

class C
  Max = 111
  def self.Max
    :Max
  end
end
p C::Max   #=> 111
p C.Max    #=> :Max
p C::Max() #=> :Max
p C.Max()  #=> :Max

class B
  attr_accessor :name
  def initialize
    @name = 'ytyaru'
  end
end
b = B.new
p b.name #=> 'ytyaru'
b.name = 'YTYARU'
p b.name #=> 'YTYARU'

def m(*args, **kwargs)
  p args   #=> [1, 2, 3]
  p kwargs #=> {:key=>"value", :k2=>"v2"}
end
m *[1,2,3], **{key:'value', k2:'v2'}

def m
  yield
end
m { p 'ブロック付きメソッド呼び出し１' }

def m(&block)
  block.call()
end
m { p 'ブロック付きメソッド呼び出し２' }

def m(a:, b:, c:)
  p "#{a} #{b} #{c}"
end
m **{a:'A', b:'B', c:'C'}
#m a=>'A', b=>'B', c=>'C'       #=> undefined local variable or method `a' for main:Object (NameError)
#m :a=>'A', :b=>'B', :c=>'C'    # 正常だが冗長。 => を使う意味がない
#m 'a'=>'A', 'b'=>'B', 'c'=>'C' #=> missing keywords: :a, :b, :c (ArgumentError)
#m a='A', b='B', c='C'          #=> wrong number of arguments (given 3, expected 0; required keywords: a, b, c) (ArgumentError)
m a:'A', b:'B', c:'C'

class D
  def m(msg)
    puts "D: #{msg}"
  end
end
class E < D
  def m(msg)
    print 'E: '
    super(msg)
  end
end
E.new.m '引数' #=> E: D: 引数

pobj = proc {|v| p v}
[1,2,3].each &pobj

class Foo
  def to_proc
    Proc.new {|v| p v}
  end
end
[1,2,3].each(&Foo.new)

