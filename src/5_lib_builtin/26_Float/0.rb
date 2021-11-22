#!/usr/bin/env ruby

# Float: 浮動少数 IEEE754
# Rational: 有理数（x/yなど分数で表せる数）
f = 0.1
p f
p f.class

c = 2 / 3
p c
p c.class

c = 2.0 / 3.0
p c
p c.class

c = Rational(2, 3)
p c
p c.class
p c.denominator # 分母
p c.numerator   # 分子
#c.denominator = 5 # undefined method `denominator=' for (2/3):Rational (NoMethodError)
#c.numerator = 5   # undefined method `numerator=' for (2/3):Rational (NoMethodError)

