#!/usr/bin/env -S ruby

$age = 10
case $age
in 0 .. 2
  "baby"
in 3 .. 6
  "little child"
in 7 .. 12
  "child"
in 13 .. 18
  "youth"
else
  "adult"
end

case 7
in 1|3|5|7|9
  '奇数'
in 0|2|4|6|8
  '偶数'
else
  '範囲外'
end


