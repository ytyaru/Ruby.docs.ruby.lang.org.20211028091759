#!/usr/bin/env -S ruby

# ローカル変数
# (A) の部分はスコープに入らない
2.times {
  p defined?(v)    # (A)
  v = 1            # ここ(宣言開始)から
  p v              # ここ(ブロックの終り)までが v のスコープ
}

v = 1 if false # 代入は行われないが宣言は有効
p defined?(v)  # => "local-variable"
p v            # => nil

# インスタンス変数
class C
  def initialize
    @a = 'a'
  end
  attr_reader :a
end
p C.new.a

# クラス変数
class Foo
  @@foo = 1
  def bar
    puts @@foo
  end
end
Foo.new.bar

class Foo
  @@foo = 1
end
class Bar < Foo
  p @@foo += 1          # => 2
end
class Baz < Bar
  p @@foo += 1          # => 3
end

module M
  @@foo = 1
end
class C
  include M
  p @@foo += 1          # => 2
end
class D
  include M
  p @@foo += 1          # => 3
end

=begin
class F
end

class G < F
  @@v = :bar
end

class F
  @@v = :foo
end

class G
  p @@v       #=> :foo
end
#=> class variable @@v of Bar is overtaken by Foo (RuntimeError)
=end


