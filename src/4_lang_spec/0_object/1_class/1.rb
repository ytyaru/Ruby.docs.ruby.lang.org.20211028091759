#!/usr/bin/env -S ruby
class C
  def m; p 'm'; end
end
c = C.new
d = C.new
c.m
d.m
def d.m; p 'M'; end
c.m
d.m
