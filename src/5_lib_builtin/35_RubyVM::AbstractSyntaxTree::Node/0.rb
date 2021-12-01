#!/usr/bin/env ruby

node = RubyVM::AbstractSyntaxTree.parse('1 + 2')
p node.children # => [[], nil, #<RubyVM::AbstractSyntaxTree::Node:OPCALL@1:0-1:5>]
p node.first_column # => 0
p node.first_lineno # => 1
puts node.inspect # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-1:5>
p node.last_column # => 5
p node.last_lineno # => 1
p node.type # => :SCOPE

