#!/usr/bin/env ruby

p /[rR]uby/.match('ruby')
p 'OK' if /[rR]uby/.match('ruby')
p 'OK' if /[rR]uby/.match('Nuby')

place = "東京都"
p /#{place}/.match("Go to 東京都") # => #<MatchData "東京都">

number = "(\\d+)"
operator = "(\\+|-|\\*|/)"
p /#{number}#{operator}#{number}/.match("43+291") #=> #<MatchData "43+291" 1:"43" 2:"+" 3:"291">

number = /\d+/
operator = /(\+|-|\*|\/)/
p /#{number}#{operator}#{number}/.match("43+291") => #<MatchData "43+291" 1:"+">

/[a-z[0-9]]/.match("y") # => #<MatchData "y">
/[a-z[0-9]]/.match("[") # => nil
r = /[a-w&&[^c-g]e]/ # ([a-w] かつ ([^c-g] もしくは e)) つまり [abeh-w] と同じ
p r.match("b") # => #<MatchData "b">
p r.match("c") # => nil
p r.match("e") # => #<MatchData "e">
p r.match("g") # => nil
p r.match("h") # => #<MatchData "h">
p r.match("w") # => #<MatchData "w">
p r.match("z") # => nil

/\w+/.match("ＡＢＣｄｅｆ") # => nil
/\W+/.match("ＡＢＣｄｅｆ") # => #<MatchData "ＡＢＣｄｅｆ">
/\s+/.match("　") # => nil
/\S+/.match("　") # => #<MatchData "　">

p /\p{Hiragana}+/.match('ぜんぶひらがな')
p /\p{Hiragana}+/.match('一部ひらがなダヨね')
p /\p{Katakana}+/.match('ゼンブカタカナ')
p /\p{Han}+/.match('漢字。') # 日本語中国語韓国語ベトナム語の漢字すべてにマッチする
p /[\p{Katakana}ー]+/.match('ゼンブカタカーナ')
p /[\p{Katakana}\p{P}ー]+/.match('「ゼンブ、カタカーナ。ダ！ヨ？」')
p /[\p{Han}\p{Hiragana}\p{Katakana}\p{P}ー]+/.match('「漢字、ひらがな！カタカーナ？。ａｂｃ」')

p /[[:alnum:]]+/.match("abＡＢ１２1") # => #<MatchData "abＡＢ１２1">
# \u3000 は全角空白
p /[[:graph:]]/.match("\u3000") # => nil
p /[[:blank:]]/.match("\u3000") # => #<MatchData "　">
p /[[:alnum:]&&[:^lower:]]/.match("ａＡ") # => #<MatchData "Ａ">
p /[[:print:]&&[:^lower:]]/.match(" ") # => #<MatchData " ">

