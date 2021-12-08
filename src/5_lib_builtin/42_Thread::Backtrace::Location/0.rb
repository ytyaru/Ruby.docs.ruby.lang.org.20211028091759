#!/usr/bin/env ruby
#coding:UTF-8
# caller_locations.rb
def a(skip)
  caller_locations(skip)
end
def b(skip)
  a(skip)
end
def c(skip)
  b(skip)
end
c(0..2).map do |call|
  puts call.to_s
end


# foo.rb
class Foo
  attr_accessor :locations
  def initialize(skip)
    @locations = caller_locations(skip)
  end
end
Foo.new(0..2).locations.map do |call|
  puts call.to_s
end
