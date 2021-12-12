#!/usr/bin/env ruby
#require 'thread'

5.times {
   Thread.new { sleep 1; puts "#{Thread.current} finished" }
}
(ThreadGroup::Default.list - [Thread.current]).each {|th| th.join}
puts "all threads finished"


thread_group = ThreadGroup.new
thread_group.add Thread.new { sleep 0.1; Thread.new { sleep 1 }; sleep 1 }
thread_group.add Thread.new { sleep 2 }
sleep 0.5
p thread_group.list # => [#<Thread:0x007fc6f1842d70 sleep>, #<Thread:0x007fc6f1842c80 sleep>, #<Thread:0x007fc6f080dba8 sleep>]
