#!/usr/bin/env ruby

enum = Enumerator.new do |y|
  y << 1
  y << 2
  y << 3
end
enum.each {|v| p v} #=> 1 2 3

text = <<-END
Hello
こんにちは
END
enum = Enumerator.new {|y|
  text.each_line(&y)
}
enum.each {|line| p line}
# => "Hello\n"
#    "こんにちは\n"

enum = Enumerator.new {|y|
  y.yield 1, 2, 3
}
enum.each {|x, y, z| p [x, y, z]} #=> [1, 2, 3]

