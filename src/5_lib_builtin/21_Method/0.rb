#!/usr/bin/env ruby

class Foo
  def foo(arg)
    "foo called with arg #{arg}"
  end
end
m = Foo.new.method(:foo)
p m             # => #<Method: Foo#foo>
p m.call(1)     # => "foo called with arg 1"

pr = Proc.new {|arg|
  "proc called with arg #{arg}"
}
p pr            # => #<Proc:0x401b1fcc>
p pr.call(1)    # => "proc called with arg 1"

class Foo
  def foo() "foo" end
  def bar() "bar" end
  def baz() "baz" end
end
obj = Foo.new
# 任意のキーとメソッドの関係をハッシュに保持しておく
methods = {1 => obj.method(:foo),
           2 => obj.method(:bar),
           3 => obj.method(:baz)}
# キーを使って関連するメソッドを呼び出す
p methods[1].call       # => "foo"
p methods[2].call       # => "bar"
p methods[3].call       # => "baz"

class Foo
  def foo() "foo" end
  def bar() "bar" end
  def baz() "baz" end
end
# 任意のキーとメソッド(の名前)の関係をハッシュに保持しておく
# レシーバの情報がここにはないことに注意
methods = {1 => :foo,
           2 => :bar,
           3 => :baz}
# キーを使って関連するメソッドを呼び出す
# レシーバは任意(Foo クラスのインスタンスである必要もない)
p Foo.new.public_send(methods[1])      # => "foo"
p Foo.new.public_send(methods[2])      # => "bar"
p Foo.new.public_send(methods[3])      # => "baz"
