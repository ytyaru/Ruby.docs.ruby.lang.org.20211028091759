#!/usr/bin/env ruby

p Encoding.aliases
p Encoding.name_list
p Encoding.list

p Encoding.compatible?(Encoding::UTF_8, Encoding::CP932)    # => nil
p Encoding.compatible?(Encoding::UTF_8, Encoding::US_ASCII) # => #<Encoding:UTF-8>
p Encoding.compatible?(Encoding::SHIFT_JIS, Encoding::SJIS) # => nil

p Encoding.compatible?("\xa1".force_encoding("iso-8859-1"), "b") #=> #<Encoding:ISO-8859-1>
p Encoding.compatible?(
  "\xa1".force_encoding("iso-8859-1"),
  "\xa1\xa1".force_encoding("euc-jp")) #=> nil

p Encoding.default_external
Encoding.default_external = Encoding::UTF_8

p Encoding.default_internal #=> nil
Encoding.default_internal = Encoding::UTF_8

#p Encoding.find('unicode') #=> unknown encoding name - unicode (ArgumentError)
#p Encoding.find('utf') #=> unknown encoding name - utf (ArgumentError)
p Encoding.find('utf-8') #<Encoding:UTF-8>

e = Encoding.find('utf-8')
p e.name
p e.names
