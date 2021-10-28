#!/usr/bin/env -S ruby
def m; :m; end
m
class C
  def m; :im; end
end
C.new.m
