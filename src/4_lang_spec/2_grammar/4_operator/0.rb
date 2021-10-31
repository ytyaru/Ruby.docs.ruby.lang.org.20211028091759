#!/usr/bin/env -S ruby

class A
  def initialize
    @ary = [0,1,2,3,4,5,6,7]
  end
  def [](i)
    @ary[i * 2]
  end
  def []=( i, v )
    @ary[i * 2] = v
  end
end
a = A.new
p a[3]      # c.[]( 3 )  に変換され、その結果は 6
p a[3] = 1  # c.[]=(3,1) に変換され、その結果は 1

class C
  def foo
    @foo
  end
  def foo=( v )
    @foo = v
  end
end
c = C.new
c.foo = 5   # c.foo=( 5 ) のように変換される
p c.foo     # => 5

class D
  attr :foo, true
end
d = D.new
d.foo = 5   # c.foo=( 5 ) のように変換される
p d.foo     # => 5

class E
  attr :foo
  def foo=(v)
    @foo = v + v
  end
end
e = E.new
e.foo = 3
p e.foo #=> 6

class F
  def foo=(v)
    @foo = v + v
  end
  attr :foo
end
f = F.new
f.foo = 3
p f.foo #=> 6

=begin
class G
  def ++(v) #=> syntax error, unexpected '+', expecting ';' or '\n' 
    p '++'
  end
end
G.new
=end

=begin
class G
  def +=(v)
    p '+='
  end
end #=> syntax error, unexpected `end', expecting end-of-input
class G
  def @+=(v) #=> `@' without identifiers is not allowed as an instance variable name
    p '+='
  end
end #=> syntax error, unexpected `end', expecting end-of-input
#g1 = G.new
#g2 = G.new
#g1 += g2
=end

class H
  def initialize
    @name ||= 'ytyaru'
    @name ||= 'YTYARU'
    p @name
  end
end
H.new

MAX ||= 100
MAX ||= 200
p MAX

a, b, c = 1, 2, 3
p a, b, c

case 2
when (1..)
  p 'A'
when 4
  p 'B'
else
  p 'C'
end
