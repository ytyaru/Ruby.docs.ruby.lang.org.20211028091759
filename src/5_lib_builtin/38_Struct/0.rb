#!/usr/bin/env ruby
#coding:UTF-8

dog = Struct.new("Dog", :name, :age)
fred = dog.new("fred", 5)
fred.age = 6
printf "name:%s age:%d\n", fred.name, fred.age
#=> "name:fred age:6" を出力します

#p Struct.new('foo', 'bar')
#=> identifier foo needs to be constant (NameError)

p Struct.new('A', 'a', 'b')
p Struct.new('B', :a, :b)

Foo = Struct.new(:foo, :bar)
p Foo                             # => Foo

Customer = Struct.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end
p Customer.new("Dave", "123 Main").greeting # => "Hello Dave!"

Point = Struct.new(:x, :y, keyword_init: true) # => Point(keyword_init: true)
p Point.new(x: 1, y: 2) # => #<struct Point x=1, y=2>
p Point.new(x: 1)       # => #<struct Point x=1, y=nil>
p Point.new(y: 2)       # => #<struct Point x=nil, y=2>
#Point.new(z: 3)       # ArgumentError (unknown keywords: z)

C = Struct.new(:foo, :bar)
c = C.new(1)
p c.values      # => [1, nil]

D = Struct.new(:foo, :bar)
p D.members      # => [:foo, :bar]

E = Struct.new(:foo, :bar)
E.new('FOO', 'BAR').each_pair {|m, v| p [m,v]}
# => [:foo, "FOO"]
#    [:bar, "BAR"]
