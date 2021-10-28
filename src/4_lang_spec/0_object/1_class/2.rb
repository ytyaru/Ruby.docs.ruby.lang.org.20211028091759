#!/usr/bin/env -S ruby
class C
  class << self
    def m; :M; end
  end
end
p C::m
p C.m
#C.new.m #=> undefined method `m' for #<C:0x00ac0d88> (NoMethodError)
class << C
  def m; :N; end
end
p C::m
p C.m
#C.new.m #=> undefined method `m' for #<C:0x00ac0d88> (NoMethodError)

