#!/usr/bin/env ruby
require 'date'

a = [
  /^[a-zA-Z_][0-9a-zA-Z_]*$/,
  Regexp.new('^[a-zA-Z_][0-9a-zA-Z_]*$'),
  Regexp.compile('^[a-zA-Z_][0-9a-zA-Z_]*$'),
]
a.each {|r|
  p r
  p r.class
  p r.match?('abc')
  p r.match?('0ab')
}

a = [
  /^[a-z]+$/i,
  Regexp.new('^[a-z]+$', Regexp::IGNORECASE),
  Regexp.compile('^[a-z]+$', Regexp::IGNORECASE),
]
a.each {|r| p r.match?('Abc') }

a = [
  /^[a-z]+$/m,
  Regexp.new('^[a-z]+$', Regexp::MULTILINE),
  Regexp.compile('^[a-z]+$', Regexp::MULTILINE),
]
a.each {|r| p r.match?("abc\ndef") }

r = /^  # コメントは除外
[a-z]+  # コメントは除外
$/x     # コメントは除外
p r.match?('abc')

r = /^            # コメントは除外
this\ is\ regexp  # コメントは除外
$/x               # コメントは除外
p r.match?('this is regexp')

r = Regexp.new('^  # コメントは除外
[a-z]+             # コメントは除外
$',                # コメントは除外
Regexp::EXTENDED)
p r.match?('abc')

r = Regexp.new('^  # コメントは除外
this\ is\ regexp   # コメントは除外
$',                # コメントは除外
Regexp::EXTENDED)
p r.match?('this is regexp')

r = /^
this         # コメントは除外
\ is         # コメントは除外
\ regexp     # コメントは除外
$/xi
p r.match?('This is RegExp')

r = Regexp.compile('
this         # コメントは除外
\ is         # コメントは除外
\ regexp     # コメントは除外
', Regexp::EXTENDED | Regexp::IGNORECASE)
p r.match?('This is RegExp')
