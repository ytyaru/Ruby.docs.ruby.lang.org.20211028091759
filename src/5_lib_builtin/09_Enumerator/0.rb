#!/usr/bin/env ruby

#str = "xyz"
#enum = Enumerator.new(str, :each_byte) #=> tried to create Proc object without a block (ArgumentError)
#p enum.map {|b| '%02x' % b }   # => ["78", "79", "7a"]


enum = Enumerator.new{|y|
  (1..10).each{|i|
    y << i if i % 5 == 0
  }
}
enum.each{|i| p i } #=> 5 10

fib = Enumerator.new { |y|
  a = b = 1
  loop {
    y << a
    a, b = b, a + b
  }
}
p fib.take(10) #=> [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]

# 1, 2, 3, 4, ... と続く Enumerator
e = Enumerator.produce(1, &:succ)
p e
p e.next
# next を呼ぶたびランダムな数値を返す Enumerator
e = Enumerator.produce { rand(10) }
p e
p e.next

# 次の火曜日を返す例
require "date"
p Enumerator.produce(Date.today, &:succ).detect(&:tuesday?)

# シンプルなレキサーの例
require "strscan"
scanner = StringScanner.new("7+38/6")
PATTERN = %r{\d+|[-/+*]}
p Enumerator.produce { scanner.scan(PATTERN) }.slice_after { scanner.eos? }.first# => ["7", "+", "38", "/", "6"]


