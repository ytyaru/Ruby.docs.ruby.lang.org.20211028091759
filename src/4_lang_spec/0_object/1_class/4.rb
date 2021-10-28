#!/usr/bin/env -S ruby
class A
  def A.m; :cm; end
end
p A::m
p A.m
class B
  def self.m; :cm; end
end
p B::m
p B.m
class C; def self.m; :cm; end; end
p C::m
p C.m
class << C
  def m; :CM; end
end
p C::m
p C.m

