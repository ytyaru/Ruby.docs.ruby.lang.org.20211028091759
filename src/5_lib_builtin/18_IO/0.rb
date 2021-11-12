#!/usr/bin/env ruby

p Encoding.default_external #<Encoding:UTF-8>
p Encoding.default_internal #nil
p Dir.glob('*')

IO.write("testfile", "This is line one,\nThis is line two,\nThis is line three,\nAnd so on...")
f = File.new("testfile")
f.each { |line| p "#{f.lineno}: #{line}" }

IO.write("testfile2", "")
f = File.new("testfile2", 'r+')
f.puts 'putsのテスト出力。'
f.puts '二行目。'
f.flush
f.fsync
f.each { |line| p "#{f.lineno}: #{line}" } # なぜか出力されない
