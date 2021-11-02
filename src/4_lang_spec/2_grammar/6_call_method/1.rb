#!/usr/bin/env ruby

a = 1
#alias b a #=> undefined method `a' for class `Object' (NameError)

$a = 1
p $a
alias $b $a
p $a #=> nill
p $b #=> nill

class A
  def ok; :A; end
end
class B < A
  def ok; :B; end
end
p B.new.ok   # => :B

# undef_method の場合はスーパークラスに同名のメソッドがあっても
# その呼び出しはエラーになる
class B
  undef_method :ok
end
#p B.new.okundefined method `ok' for #<B:0x01d2c2d8> (NoMethodError)

class C < A
  def ok
    puts 'C'
  end
end
# remove_method の場合はスーパークラスに同名のメソッドがあると
# それが呼ばれる
class C
  remove_method :ok
end
p C.new.ok   # => :A

p defined? print

p defined? super
