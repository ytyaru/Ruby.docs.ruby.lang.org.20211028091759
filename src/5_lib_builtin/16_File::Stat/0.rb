#!/usr/bin/env ruby

p $:[0]
p File::Stat.new($:[0])
s = File::Stat.new($:[0])
p s.atime
p s.ctime
p s.mtime
#p s.birthtime #=> birthtime() function is unimplemented on this machine (NotImplementedError)
