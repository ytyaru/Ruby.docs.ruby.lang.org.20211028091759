#!/usr/bin/env ruby

# Ruby2.4以降、Bignu, FixnumはIntegerのエイリアスである

# 平方根
p Integer.sqrt(0)        # => 0
#p Integer.sqrt(-1)       # => Numerical argument is out of domain - "isqrt" (Math::DomainError)
p Integer.sqrt(1)        # => 1
p Integer.sqrt(2)        # => 1  近似値は1.41421356...（一夜一夜に人見頃）
p Integer.sqrt(3)        # => 1  近似値は1.7320508...（人並みにおごれや）
p Integer.sqrt(4)        # => 2
p Integer.sqrt(5)        # => 2  近似値は2.2360679...（富士山麓オウム鳴く）
p Integer.sqrt(24)       # => 4
p Integer.sqrt(25)       # => 5
p Integer.sqrt(10**400) == 10**200 # => true

# べき乗
p 2 ** 3
p 2.pow 3

# 最大公約数
p 2.gcd(2)                    # => 2
p 4.gcd(6)                    # => 2
p 4.gcd(8)                    # => 4
p 3.gcd(7)                    # => 1
p 3.gcd(-7)                   # => 1
p ((1<<31)-1).gcd((1<<61)-1)  # => 1

# 最小公倍数
p 2.lcm(2)                    # => 2
p 4.lcm(6)                    # => 12
p 4.lcm(8)                    # => 8
p 3.lcm(7)                    # => 21
p 3.lcm(-7)                   # => 21
p ((1<<31)-1).lcm((1<<61)-1)  # => 4951760154835678088235319297

# 最大公約数と最小公倍数
p 2.gcdlcm(2)                    # => [2,2]
p 4.gcdlcm(6)                    # => [2,12]
p 4.gcdlcm(8)                    # => [4,8]
p 3.gcdlcm(7)                    # => [1,21]
p 3.gcdlcm(-7)                   # => [1,21]
p ((1<<31)-1).gcdlcm((1<<61)-1)  # => [1,4951760154835678088235319297]


