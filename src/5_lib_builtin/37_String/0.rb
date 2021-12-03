#!/usr/bin/env ruby
#coding:UTF-8
p "いろは".size     #=> 3
p "いろは".bytesize #=> 9
#p "山田は生き返った。".grapheme_clusters

p 'abcdefg-abcdefg'.gsub(/def/, '!!') # => "abc!!g-abc!!g"
p 'abcdefg-abcdefg'.sub(/def/, '!!')  # => "abc!!g-abcdefg"

p 'abc-abc'.tr('b', 'B')
p 'abc-abc'.tr('ab', 'AB')

p 'abc'.replace('def') # def

p 'abc123def'.match('\d+')    ##<MatchData "123">
p 'abc123def'.match('\d+')[0] #"123"

p 'abc123def'.scan(/\d+/)

s = 'abc_DEF'
p s.capitalize # Abc_def
p s.downcase   # abc_def
p s.swapcase   # ABC_def
p s.upcase     # ABC_DEF

s = "末尾に改行あり\n"
p s       # Abc_def
p s.chomp # Abc_def

s = 'あいうえお'
p s      # Abc_def
p s.chop # Abc_def

s = 'あいうえおえういあ'
p s.delete 'あ'        # 'いうえおえうい'
p s.delete 'う'        # 'あいえおえいあ'
p s.delete_prefix 'あ' # 'いうえおえういあ'
p s.delete_suffix 'あ' # 'あいうえおえうい'

s = " \t\nabcdef \t\n"
p s.strip # "a b\\tc\\nd　e"
s = 'abbbbc'
p s.squeeze # abc
