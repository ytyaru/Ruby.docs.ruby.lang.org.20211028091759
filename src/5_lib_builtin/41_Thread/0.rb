#!/usr/bin/env ruby
#coding:UTF-8
for i in 1..5
   Thread.new(i) {|t| p t }
   Thread.start(i) {|t| p t }
   Thread.fork(i) {|t| p t }
end

a = Thread.new { print "a"; Thread.stop; print "c" }
sleep 0.1 while a.status!='sleep'
print "b"
a.run
a.join
# => "abc"

th1 = Thread.new do
  begin
    sleep 10
    p 'これが表示される前にキルされるはず。'
  ensure
    p "this will be displayed"
  end
end
sleep 0.1
th1.kill

#=> "this will be displayed"
