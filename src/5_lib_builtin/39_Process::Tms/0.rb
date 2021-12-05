#!/usr/bin/env ruby
#coding:UTF-8
p Process.times

t = Process.times
p t.cstime
p t.cutime
p t.stime
p t.utime

t.cstime = 123
t.cutime = 234
t.stime = 345
t.utime = 456
p t.cstime
p t.cutime
p t.stime
p t.utime
