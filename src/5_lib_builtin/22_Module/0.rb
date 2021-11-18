#!/usr/bin/env ruby

class C
  FOO = 1
  p Module.constants.include? :FOO
end
p C::FOO           #=> 1
p Module.constants #=> [...] 出力中に :FOO は現われない
p Module.constants.include? :FOO
p Module::constants.include? :FOO

module Foo
  module Bar
    module Baz
      p Module.nesting   # => [Foo::Bar::Baz, Foo::Bar, Foo]
    end
  end
end
p Module.nesting   # => [Foo::Bar::Baz, Foo::Bar, Foo]

mod = Module.new
mod.module_eval {|m|
  # ...
}
p mod

Object.class_eval { remove_const :Foo }
m = Module.new
p m               # => #<Module 0lx40198a54>
p m.name          # => nil   # まだ名前は未定
Foo = m
# m.name          # ここで m.name を呼べば m の名前は "Foo" に確定する
Bar = m
p m.name          # "Foo" か "Bar" のどちらかに決まる

module A
  refine Object do
  end
end
module B
  refine Object do
  end
end
using A
using B
p Module.used_modules
#=> [B, A]

Object.class_eval { remove_const :A}
Object.class_eval { remove_const :B}
module A
  attr_accessor :name
end
class B
  include A
end
b = B.new
p b.name
b.name = 'ytyaru'
B.b.name

