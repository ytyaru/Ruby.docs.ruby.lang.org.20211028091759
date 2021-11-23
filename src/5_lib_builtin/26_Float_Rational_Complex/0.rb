#!/usr/bin/env ruby

# Float: 浮動少数 IEEE754
# Rational: 有理数（x/yなど分数で表せる数）
f = 0.1
p f
p f.class

i = 2 / 3
p i
p i.class

f = 2.0 / 3.0
p f
p f.class

r = Rational(2, 3)
p r
p r.class
p r.denominator # 分母
p r.numerator   # 分子
#r.denominator = 5 # undefined method `denominator=' for (2/3):Rational (NoMethodError)
#r.numerator = 5   # undefined method `numerator=' for (2/3):Rational (NoMethodError)

c = Complex(5, 3)
p c
p c.class
p c.real # 実数
p c.imag # 虚数
