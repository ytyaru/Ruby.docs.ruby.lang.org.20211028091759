#!/usr/bin/env ruby

k = Class.new{|c|
  def initialize
    p "in initialize"
  end

  def hoge
    p "hoge hoge hoge"
  end
}
o = k.new              #=> "in initialize"
o.hoge                 #=> "hoge hoge hoge"
