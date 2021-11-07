#!/usr/bin/env ruby

ec = Encoding::Converter.new("CP932", "UTF-8")
p ec.convpath
ec = Encoding::Converter.new("UTF-16BE", "UTF-8")
p ec.convpath
ec = Encoding::Converter.new("UTF-16BE", "UTF-8", :universal_newline => true)
p ec.convpath #=> [[#<Encoding:UTF-16BE>, #<Encoding:UTF-8>],"universal_newline"]

ec = Encoding::Converter.new("CP932", "UTF-8")
t = ec.convert('あいうえお'.encode('CP932'))
p t => "あいうえお"
p t.dump #=> "\"\\u3042\\u3044\\u3046\\u3048\\u304A\""

