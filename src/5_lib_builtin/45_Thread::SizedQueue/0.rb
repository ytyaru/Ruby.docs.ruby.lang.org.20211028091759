#!/usr/bin/env ruby

require 'thread'

q = SizedQueue.new(1)

th = Thread.start {
  while line = q.pop
    print line
  end
}

while l = gets
  q.push(l)
end
q.push(l)

th.join
