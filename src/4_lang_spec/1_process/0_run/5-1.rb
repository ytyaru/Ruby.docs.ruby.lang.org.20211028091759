#!/usr/bin/env -S ruby

loop { p 'LOOP'; break; }

loop do
  p 'LOOP'
  break
end

3.times { p 'TIME' }
3.times {|i| p "#{i}回目" }
3.times do
  p 'TIME'
end
3.times do |i|
  p "#{i}回目"
end


1.upto(3) { p 'UPTO' }
#1.upto 3 { p 'UPTO' } #=> syntax error, unexpected '{', expecting end-of-input (SyntaxError)
1.upto(3) {|i| p "#{i}:UPTO" }
5.upto(7) do |i|
  p "#{i}:UPTO"
end


3.downto(1) { p 'DOWNTO' }
3.downto(1) {|i| p "#{i}:DOWNTO" }
7.downto(5) do |i|
  p "#{i}:DOWNTO"
end

