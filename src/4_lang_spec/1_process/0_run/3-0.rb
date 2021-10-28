#!/usr/bin/env -S ruby

v = 7
case v
when 1,3,5,7,9
  p '奇数'
when 0,2,4,6,8
  p '偶数'
else
  p '範囲外'
end

if v < 10
  if 1 == (v % 2)
    p '奇数'
  else
    p '偶数'
  end
else
  p '範囲外'
end

$age = 10
case $age
when 0 .. 2
  p "baby"
when 3 .. 6
  p "little child"
when 7 .. 12
  p "child"
when 13 .. 18
  p "youth"
else
  p "adult"
end

case $age
when Range.new(0, 2)
  p "baby"
when Range.new(3, 6)
  p "little child"
when Range.new(7, 12)
  p "child"
when Range.new(13, 18)
  p "youth"
else
  p "adult"
end

if 0 <= $age and $age <= 2
  p "baby"
elsif 3 <= $age and $age <= 6
  p "little child"
elsif 7 <= $age and $age <= 12
  p "child"
elsif 13 <= $age and $age <= 18
  p "youth"
else
  p "adult"
end

