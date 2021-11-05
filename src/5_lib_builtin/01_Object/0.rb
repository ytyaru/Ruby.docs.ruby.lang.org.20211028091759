#!/usr/bin/env ruby

# clone/dup
p 'clone/dup'
class C; end
c1 = C.new
c2 = c1.clone # deep copy
c3 = c1.dup   # shallow copy

# freeze/frozen?
p 'freeze/frozen?'
s = 'ABC'
s.replace('xyz')
p s #=> "xyz"
s.freeze
#s.replace('abc') #=> can't modify frozen String: "xyz" (FrozenError)

s = 'ABC'
s.freeze
s = 'xyz'
p s #=> "xyz"

class C; end
C.freeze
#class C
#  def m; :m; end #=> can't modify frozen class: C (FrozenError)
#end

class C; end
p C.frozen? #=> false
C.freeze
p C.frozen? #=> true

# instance_of?(klass)`/`is_a?(mod)`,`kind_of?(mod)
p 'instance_of?'
class C; end
class D; end
p C.new.instance_of?(C) #=> true
p C.new.instance_of?(D) #=> false
class E < D; end
p E.new.instance_of?(D) #=> false

Object.send(:remove_const, :C)
module M; end
class C
  include M
end
class D; end
C.new.is_a?(M) #=> true
D.new.is_a?(M) #=> false

# nil?
Object.send(:remove_const, :C)
p 'nil?'
class C; end
c = C.new
p c.nil? #=> false

c = nil
p c.nil? #= true

# tap, then
p 'tap, then'
(1..10)                  .tap {|x| puts "original: #{x}" }
  .to_a                  .tap {|x| puts "array:    #{x}" }
  .select {|x| x.even? } .tap {|x| puts "evens:    #{x}" }
  .map {|x| x*x }        .tap {|x| puts "squares:  #{x}" }

p 3.next.then {|x| x**x }.to_s             # => "256"
p "my string".yield_self {|s| s.upcase }   # => "MY STRING"

p ARGF
p ARGV
p ENV

