#!/usr/bin/env ruby

hash = {}
p hash
hash = {key: 'value', k2: 'v2'}
p hash

h = {1 => "value"}
h.default = "none"
g = Hash[h]
p g #=> {1=>"value"}
p h[:no] #=> "none"
p g[:no] #=> nil
h[:add] = "some"
p h #=> {1=>"value", :add=>"some"}
p g #=> {1=>"value"}
h[1] << 'plus' #破壊的操作
p h #=> {1=>"valueplus", :add=>"some"}
p g #=> {1=>"valueplus"}

ary = [1,"a", 2,"b", 3,["c"]]
p Hash[*ary]  # => {1=>"a", 2=>"b", 3=>["c"]}

alist = [[1,"a"], [2,"b"], [3,["c"]]]
p alist.flatten(1) # => [1, "a", 2, "b", 3, ["c"]]
p Hash[*alist.flatten(1)]  # => {1=>"a", 2=>"b", 3=>["c"]}

keys = [1, 2, 3]
vals = ["a", "b", ["c"]]
alist = keys.zip(vals)     # あるいは alist = [keys,vals].transpose
p alist # => [[1, "a"], [2, "b"], [3, ["c"]]]
p Hash[alist]  # => {1=>"a", 2=>"b", 3=>["c"]}

alist = [[1,["a"]], [2,["b"]], [3,["c"]], [[4,5], ["a", "b"]]]
hash = Hash[alist] # => {1=>["a"], 2=>["b"], 3=>["c"], [4, 5]=>["a", "b"]}

h = Hash.new([])
h[0] << 0
h[1] << 1
p h.default #=> [0, 1]
p h

h = Hash.new([])
p h[1].object_id        #=> 6127150
p h[1] << "bar"         #=> ["bar"]
p h[1]                  #=> ["bar"]
p h[2]                  #=> ["bar"]
p h[2].object_id        #=> 6127150
p h                     #=> {}
h = Hash.new([].freeze)
h[0] += [0] #破壊的でないメソッドはOK
#h[1] << 1
# エラー: can't modify frozen Array (FrozenError)

# ブロックではないデフォルト値は全部同一のオブジェクトなので、
# 破壊的変更によって他のキーに対応する値も変更されます。
h = Hash.new("foo")
p h[1]                  #=> "foo"
p h[1].object_id        #=> 6127170
p h[1] << "bar"         #=> "foobar"
p h[1]                  #=> "foobar"
p h[2]                  #=> "foobar"
p h[2].object_id        #=> 6127170
p h                     #=> {}
# ブロックを与えると、対応する値がまだ無いキーが呼び出される度に
# ブロックを評価するので、全て別のオブジェクトになります。
h = Hash.new {|hash, key| hash[key] = "foo"}
p h[1]                  #=> "foo"
p h[1].object_id        #=> 6126900
p h[1] << "bar"         #=> "foobar"
p h[1]                  #=> "foobar"
p h[2]                  #=> "foo"
p h[2].object_id        #=> 6126840
p h                     #=> {1=>"foobar", 2=>"foo"}
# 値が設定されていないときに(fetchのように)例外をあげるようにもできる
h = Hash.new {|hash, key|
                raise(IndexError, "hash[#{key}] has no value")
             }
#h[1]
# エラー hash[1] has no value (IndexError)

h1 = {a:1, b:2}
h2 = {a:1, b:2, c:3}
p h1 < h2    # => true
p h2 < h1    # => false
p h1 < h1    # => false

h1 = {a:1, b:2}
h2 = {a:1, b:2, c:3}
p h1 <= h2   # => true
p h2 <= h1   # => false
p h1 <= h1   # => true

h = {}
h[:key] = "value"
p h #=>{:key => "value"}

h1 = { "a" => 100, 2 => ["some"], :c => "c" }
p h1.keys           #=> ["a", 2, :c]

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 246, "c" => 300 }
h3 = { "b" => 357, "d" => 400 }
p h1.merge          #=> {"a"=>100, "b"=>200}
p h1.merge(h2)      #=> {"a"=>100, "b"=>246, "c"=>300}
p h1.merge(h2, h3)  #=> {"a"=>100, "b"=>357, "c"=>300, "d"=>400}
p h1.merge(h2) {|key, oldval, newval| newval - oldval}
                  #=> {"a"=>100, "b"=>46,  "c"=>300}
p h1.merge(h2, h3) {|key, oldval, newval| newval - oldval}
                  #=> {"a"=>100, "b"=>311, "c"=>300, "d"=>400}
p h1                #=> {"a"=>100, "b"=>200}

