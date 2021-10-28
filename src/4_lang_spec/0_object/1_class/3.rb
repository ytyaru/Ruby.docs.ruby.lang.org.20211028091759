#!/usr/bin/env -S ruby
class A; end
a1 = A.new
a2 = A.new
p A.singleton_class
p a1.singleton_class
p a2.singleton_class

