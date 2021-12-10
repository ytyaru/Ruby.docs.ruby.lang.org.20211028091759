#!/usr/bin/env ruby
#require 'thread'
p Thread::Mutex.new
m = Thread::Mutex.new
m.synchronize {
  p 'mutex'
}
