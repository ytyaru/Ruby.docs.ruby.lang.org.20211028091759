#!/usr/bin/env ruby

str = '<p><a href="http://example.com">example.com</a></p>'
if %r[<a href="(.*?)">(.*?)</a>] =~ str
  p $~[1]
end
#=> "http://example.com"

/(foo)(bar)(BAZ)?/ =~ "foobarbaz"
p $~.to_a       # => ["foobar", "foo", "bar", nil]
p $~[0]         # => "foobar"
p $~[1]         # => "foo"
p $~[2]         # => "bar"
p $~[3]         # => nil        (マッチしていない)
p $~[4]         # => nil        (範囲外)
p $~[-2]        # => "bar"

/(foo)(bar)/ =~ "foobarbaz"
p $~[0..2]      # => ["foobar", "foo", "bar"]

/(foo)(bar)/ =~ "foobarbaz"
p $~[0, 3]      # => ["foobar", "foo", "bar"]

p /\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")[:cents] # => "67"
p /(?<alpha>[a-zA-Z]+)|(?<num>\d+)/.match("aZq")[:num] # => nil
#p /(?<alpha>[a-zA-Z]+)/.match("aZq")[:num] #=> undefined group name reference: num (IndexError)

/(foo)(bar)(BAZ)?/ =~ "foobarbaz"
p $~.to_a       # => ["foobar", "foo", "bar", nil]
p $~.captures   # => ["foo", "bar", nil]

m = /(?<a>.)(?<b>.)/.match("01")
p m.named_captures # => {"a" => "0", "b" => "1"}

m = /(?<a>.)(?<b>.)?/.match("0")
p m.named_captures # => {"a" => "0", "b" => nil}

m = /(?<a>.)(?<a>.)/.match("01")
p m.named_captures # => {"a" => "1"}

m = /(?<a>x)|(?<a>y)/.match("x")
p m.named_captures # => {"a" => "x"}
p m.captures #=> ["x", nil]
