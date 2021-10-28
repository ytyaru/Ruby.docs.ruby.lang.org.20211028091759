#!/usr/bin/env -S ruby
class A
  def m; :m1; end
  def m(x); :m2; end
  def m(x, y); :m3; end
end

