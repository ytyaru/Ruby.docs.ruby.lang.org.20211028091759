#!/usr/bin/env ruby
p rand
p rand 2
p rand 1..6

p Random.rand      # 0.0〜1.0
p Random.rand 2    # 0〜1
p Random.rand 6    # 0〜5
p Random.rand 3..7 # 3〜7
#p Random.rand 0    # invalid argument - 0 (ArgumentError)
#p Random.rand -1   # invalid argument - -1 (ArgumentError)
#p Random.rand -1.0 # invalid argument - -1.0 (ArgumentError)
p Random.rand 0.0
p Random.rand 1.0
p Random.rand 9.0
p Random.rand 0.1

p Random.bytes(1)
p Random.bytes(8)

r = Random.new
p r
p r.class
p Random.new(1234).rand

p Random.new_seed

r = Random.new
p r.seed
