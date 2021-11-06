#!/usr/bin/env ruby

a = [1,2,3]
p a
a = Array.new(3) {|i| i*2} #=> [0, 2, 4]
p a

a = [1,2,3]
a.fill(9) #=> [9,9,9]
p a

a = [0,1,2,3,4,5,6,7,8,9]
a.fill('x', 5..7) #=> [0, 1, 2, 3, 4, "x", "x", "x", 8, 9]
p a

[1,2,3].each {|v| p v}
a = %w(a b c)
a.each_index {|i| p "#{i}:#{a[i]}"} #=> 0:a 1:b 2:c

a = [1,2,3]
a[0]  #=> 1
a[9]  #=> nil
a[-1] #=> 3
#a.fetch(9) #=> index 9 outside of array bounds: -3...3 (IndexError)

a = [0,1,2,3,4,5,6,7,8,9]
p a[2..4]    #=> [2, 3, 4]
p a[7..99]   #=> [7, 8, 9]
p a[99..100] #=> nil
p a[99..-1]  #=> nil
p a[-3..-1]  #=> [7, 8, 9]
p a[-1..-3]  #=> []

a = [0,1,2,3,4,5,6,7,8,9]
p a[2, 2]  #=> [2, 3]
p a[5, 3]  #=> [5, 6, 7]
p a[5, -1] #=> nil

a = [0,1,2,3,4,5,6,7,8,9]
p a.take(3) #=> [0,1,2]

p [1,2,3,4,5] & [1,3] #=> [1,3]
p [1,2,3] | [0,1,4] #=> [1, 2, 3, 0, 4]
p [1,2] + [2,3] #=> [1, 2, 2, 3]
p [1,2,3] - [2] #=> [1,3]
p [1,2,3] * 2 #=> [1,2,3,1,2,3]
p [1,2,3] * ',' #=> "1,2,3"

a = [1]
a << 2
p a #=> [1,2]

p [1,2,3] == [1,2,3] #=> true
p [1,2,3] == [1,2]   #=> false

p [true,true].all?  #=> true
p [true,false].all? #=> false
p [0,2,4].all? {|v| 0 == (v % 2)} #=> true
p [1,2,3].all? {|v| 0 == (v % 2)} #=> false
p %w(abc def ghi).all?(/[a-z]+/) #=> true
p %w(abc 123 ghi).all?(/[a-z]+/) #=> false

p [true,false].any? #=> true
p [false,false].any? #=> false
p [0,3,5].any? {|v| 0 == (v % 2)} #=> true
p [1,3,5].any? {|v| 0 == (v % 2)} #=> false
p %w(abc 123 456).any?(/[a-z]+/) #=> true
p %w(123 456 789).any?(/[a-z]+/) #=> false

p [].empty?  #=> true
p [1].empty? #=> false

a = %w(a b c)
p a.include?('b') #=> true
p a.include?('z') #=> false

[false,false].none? #=> true
[true,false].none? #=> false
[1,3,5].none? {|v| 0 == (v % 2)} #=> true
[0,3,5].none? {|v| 0 == (v % 2)} #=> false
%w(123 456 789).none?(/[a-z]+/) #=> true
%w(123 def ghi).none?(/[a-z]+/) #=> false

[true,false,false].one? #=> true
[true,true,false].one? #=> false
[0,3,5].one? {|v| 0 == (v % 2)} #=> true
[0,2,5].one? {|v| 0 == (v % 2)} #=> false
%w(abc 123 456).one?(/[a-z]+/) #=> true
%w(abc def 789).one?(/[a-z]+/) #=> false

a = [1,2,3]
a.clear
p a #=> []

a = %w(a b c d a b)
a.delete 'a'
p a #=> ["b", "c", "d", "b"]

a = %w(a b c)
a.delete_at 0 #=> "a"
p a #=> ["b", "c"]

a = [0,1,2,3]
a.delete_if {|v| 0 == (v % 2)}
p a #=> [1,3]

a = [0,1,2,3]
a.reject! {|v| 0 == (v % 2)}
p a #=> [1,3]

a = [0,1,2,3,4,5,6,7,8,9]
a.drop(3) #=> [3, 4, 5, 6, 7, 8, 9]
p a #=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

a = [0,1,2,3,4,5,6,7,8,9]
a.drop_while {|v| v < 3} #=> [3, 4, 5, 6, 7, 8, 9]
p a #=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

a = [0,1]
a.append 2 #=> [0,1,2]
a.push 3   #=> [0,1,2,3]
p a #=> [0,1,2,3]
p a.pop #=> 3
p a #=> [0,1,2]

a = [1,2]
a.prepend 0
p a #=> [0,1,2]
a = [1,2]
a.unshift 0
p a #=> [0,1,2]

a = [0, 1, 2]
a.insert 1, 'x'
p a #=> [0, "x", 1, 2]
a = [0, 1, 2]
a.insert 1, 'x', 'y'
p a #=> [0, "x", "y", 1, 2]

[0,1,2,3].select {|v| v.even? } #=> [0,2]
[0,1,2,3].filter {|v| v.even? } #=> [0,2]

a = %w(a b c d e f)
a.keep_if {|v| v =~ /[aiueo]/} # => ["a", "e"]
p a # => ["a", "e"]

[1,2,3].sum #=> 6

# 合計
p [1, 2, 3, 4, 5].inject {|result, item| result + item } #=> 15
# 自乗和
p [1, 2, 3, 4, 5].inject(0) {|result, item| result + item**2 }  #=> 55

result = 0
[1, 2, 3, 4, 5].each {|v| result += v }
p result # => 15

p [1, 2, 3, 4, 5].inject(:+)                    #=> 15
p ["b", "c", "d"].inject("abbccddde", :squeeze) #=> "abcde"

[1, 2, 3, 4, 5].reject {|i| i.even? }  # => [1, 3, 5]

[1, 2, 3].map {|v| v*2} #=> [2, 4, 6]
[1, 2, 3].collect {|v| v*2} #=> [2, 4, 6]

a = [1, 2, 3, 4]
a.combination(1).to_a  #=> [[1],[2],[3],[4]]
a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
a.combination(4).to_a  #=> [[1,2,3,4]]
a.combination(0).to_a  #=> [[]]: one combination of length 0
a.combination(5).to_a  #=> []  : no combinations of length 5

a = [1, 2, 3]
a.permutation.to_a     #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(1).to_a  #=> [[1],[2],[3]]
a.permutation(2).to_a  #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
a.permutation(3).to_a  #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(0).to_a  #=> [[]]: one permutation of length 0
a.permutation(4).to_a  #=> []  : no permutations of length 4

a = [1, 2, 3, 4]
a.repeated_combination(4).to_a
a = [1, 2, 3]
a.repeated_permutation(3).to_a

[1,2,3].product([4,5]) #=> [[1, 4], [1, 5], [2, 4], [2, 5], [3, 4], [3, 5]]
%w(♠ ♥ ♦ ♣).product(%w(A 2 3 4 5 6 7 8 9 10 J Q K))

a = [1, nil, 2, nil, 3, nil]
p a.compact   #=> [1, 2, 3]
p a           #=> [1, nil, 2, nil, 3, nil]
a.compact!
p a           #=> [1, 2, 3]
p a.compact!  #=> nil

p [0,1,2].count #=> 3
p [0,1,2].count {|v| v.even?} #=> 2
p [0,1,2,1,1].count 1 #=> 3

p [0,1,2].size   #=> 3
p [0,1,2].length #=> 3

[3,1,5,2].max #=> 5
[3,1,5,2].min #=> 1
[3,1,5,2].max 3 #=> [5,3,2]
[3,1,5,2].min 3 #=> [1,2,3]
ary = %w(albatross dog horse)
ary.max {|a, b| a.length <=> b.length }    #=> "albatross"
ary.max(2) {|a, b| a.length <=> b.length } #=> ["albatross", "horse"]

any = %w(albatross dog horse)
any.minmax                                 #=> ["albatross", "horse"]
any.minmax{|a,b| a.length <=> b.length }   #=> ["dog", "albatross"]
[].minmax # => [nil, nil]

(1..6).to_a.sample #=> 4

a = [3,1,4,2]
p a.sort
p a
a.sort!
p a
p a.reverse
a.reverse!
p a
p a.shuffle
a.shuffle!
p a
p a.rotate
a.rotate!
p a

ary1 = [ "d", "a", "e", "c", "b" ]
p ary1.sort                             #=> ["a", "b", "c", "d", "e"]

ary2 = ["9", "7", "10", "11", "8"]
p ary2.sort                             #=> ["10", "11", "7", "8", "9"] (文字列としてソートするとこうなる)
p ary2.sort{|a, b| a.to_i <=> b.to_i }  #=> ["7", "8", "9", "10", "11"] (ブロックを使って数字としてソート)

# sort_by を使っても良い
p ary2.sort_by{|x| x.to_i }             #=> ["7", "8", "9", "10", "11"]
fruits = %w{apple pear fig}
fruits.sort_by! { |word| word.length }
fruits # => ["fig", "pear", "apple"]

[1,1,3,2,2,1].uniq #=> [1,3,2]

p [[1,2],
   [3,4],
   [5,6]].transpose
# => [[1, 3, 5], [2, 4, 6]]

p [1,2,3].zip([4,5,6], [7,8,9]) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]

