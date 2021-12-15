#!/usr/bin/env ruby
class Foo
  def foo() "foo" end
  def bar() "bar" end
  def baz() "baz" end
end

# 任意のキーとメソッドの関係をハッシュに保持しておく
# レシーバの情報がここにはないことに注意
methods = {1 => Foo.instance_method(:foo),
           2 => Foo.instance_method(:bar),
           3 => Foo.instance_method(:baz)}

# キーを使って関連するメソッドを呼び出す
# レシーバは任意(Foo クラスのインスタンスでなければならない)
p methods[1].bind(Foo.new).call      # => "foo"
p methods[2].bind(Foo.new).call      # => "bar"
p methods[3].bind(Foo.new).call      # => "baz"

class Foo
  def foo
    p :foo
  end
  @@orig_foo = instance_method :foo
  def foo
    p :bar
    @@orig_foo.bind(self).call
  end
end
Foo.new.foo
# => :bar
#    :foo
