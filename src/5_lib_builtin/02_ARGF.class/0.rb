#!/usr/bin/env ruby
puts "ARGF.argv: #{ARGF.argv}"
puts "ARGF.file: #{ARGF.file}"
puts "ARGF.filename: #{ARGF.filename}"
puts "ARGF.path : #{ARGF.path}"
puts "ARGF.fileno : #{ARGF.fileno}"
puts "ARGF.internal_encoding: #{ARGF.internal_encoding}"
puts "ARGF.lineno: #{ARGF.lineno}"
puts "ARGF.file.lineno: #{ARGF.file.lineno}"
#puts "ARGF.readlines: #{ARGF.readlines}"

#while line = ARGF.gets
#  puts line
#end

ARGF.each {|line|
  puts line
}
