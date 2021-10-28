#!/usr/bin/env -S ruby
class C
  def m; p 'm'; end
end
c = C.new
d = C.new
def d.m; p 'M'; end
c.m
d.m

