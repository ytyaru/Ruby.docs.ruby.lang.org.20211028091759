#!/usr/bin/env -S ruby

MAX = 1
MAX = 2
p MAX

a, b = 1, 2
p a
p b

a, = 1, 2, 3
p a #=> 1

_, a, = 1, 2, 3
a #=> 2

*, a = 1, 2, 3
a #=> 3

a, *, b = 1, 2, 3, 4
a #=>1
b #=>4

def m
  local_var = 1
end

class C
  local_var = 1
  @@class_var = 2
end
#C::local_var    #=> undefined method `local_var' for C:Class (NoMethodError)
#C.local_var     #=> undefined method `local_var' for C:Class (NoMethodError)
#C.new.local_var #=> undefined method `local_var' for #<C:0x006f1668> (NoMethodError)
#C::class_var    #=> undefined method `class_var' for C:Class (NoMethodError)
#C.class_var     #=> undefined method `class_var' for C:Class (NoMethodError)
#C.new.class_var #=> undefined method `class_var' for #<C:0x0042a938> (NoMethodError)

a = '1'
def m
  a = 2
  p a
end
m   #=> 2
p a #=> 1

def m
  a = 1
  def n
    a = 2
    p "n:#{a}"
  end
  n #=> "n:2"
  p "m:#{a}"
end
m #=> "m:1"

['A','B','C'].each_with_index do |v,i|
  p "#{i}:#{v}"
end

class C
  def initialize
    @name = 'A'
  end
  def get_name; @name; end
end
C.new.get_name #=> 'A'
#C.new.@name #=> syntax error, unexpected instance variable (SyntaxError)
#C.@name #=> syntax error, unexpected instance variable (SyntaxError)

class C; end
#C.new.not_define_var #=> undefined method `not_define_var' for #<C:0x017cc688> (NoMethodError)

class C
  def m; @name; end
end
C.new.m #=> nil

class C
  @@cls_var = 1
  def im; @@cls_var; end
  def self.cm; @@cls_var; end
  def self.cm_ndv; @@not_define_var; end
end
#C.@@cls_var #=> syntax error, unexpected class variable (SyntaxError)
C.cm #=> 1
C.new.im #=> 1
#C.cm_ndv #=> uninitialized class variable @@not_define_var in C (NameError)

class C
  @cls_var = 1
  def im; @cls_var; end
  def self.cm; @cls_var; end
end
#C.@cls_var #=> syntax error, unexpected instance variable (SyntaxError)
C.cm #=> 1
C.new.im #=> nil
class D < C; end
D.cm #=> nil

$global = 1
def m
  p $global #=> 1
  $global = 2
  p $global #=> 2
end
m

#dynamic constant assignment (SyntaxError)
#def m
#  MAX = 1
#end

