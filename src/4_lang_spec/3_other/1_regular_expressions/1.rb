#!/usr/bin/env ruby

p /\R/.match("\r\n")
p /\R/.match("\r")
p /\R/.match("\n")

# 以下の正規表現は 最初に大文字が1文字以上(H)で、小文字が1文字以上(l)、
# lが2文字(ll)の後ろにoが続く文字列にマッチします。
"Hello".match(/[[:upper:]]+[[:lower:]]+l{2}o/) # => #<MatchData "Hello">

p /^.*(\d+)\./.match("Copyright 2013.")  # => #<MatchData "Copyright 2013." 1:"3">
p /^.*?(\d+)\./.match("Copyright 2013.")  # => #<MatchData "Copyright 2013." 1:"2013">

# ここでは <b> と </b> の対応を取る
p %r{<b>.*</b>}.match("<b>x</b>y<b>z</b>") # => #<MatchData "<b>x</b>y<b>z</b>">
p %r{<b>.*?</b>}.match("<b>x</b>y<b>z</b>") # => #<MatchData "<b>x</b>">
p %r{<b>(.*)+</b>}.match("<b>x</b>y<b>z</b>") # => #<MatchData "<b>x</b>y<b>z</b>" 1:"">

# (..) に at がマッチしたのを \1 で参照し、マッチが成功している。
m = /[csh](..) [csh]\1 in/.match("The cat sat in the hat")
p m #=> #<MatchData "cat sat in" 1:"at">
# Regexp#match でマッチしたテキストは MatchData#[] で参照できる
p m[1] # => "at"

m = /\$(?<dollars>\d+)\.(?<cents>\d+)/.match("$3.67")
p m # => #<MatchData "$3.67" dollars:"3" cents:"67">
p m[:dollars] # => "3"
p m[:cents] # => "67"

p /(?<vowel>[aeiou]).\k<vowel>.\k<vowel>/.match('ototomy') # => #<MatchData "ototo" vowel:"o">

/\$(?<dollars>\d+)\.(?<cents>\d+)/ =~ "$3.67" # => 0
p dollars # => "3"
p cents # => "67"

p /(.)(.)\k<-2>\k<-1>/.match("xyzyz") # => #<MatchData "yzyz" 1:"y" 2:"z">

# The pattern below matches a vowel followed by 2 word characters:
# 'aen'
p /[aeiou]\w{2}/.match("Caenorhabditis elegans") #=> #<MatchData "aen">
# Whereas the following pattern matches a vowel followed by a word
# character, twice, i.e. <tt>[aeiou]\w[aeiou]\w</tt>: 'enor'.
p /([aeiou]\w){2}/.match("Caenorhabditis elegans")
    #=> #<MatchData "enor" 1:"or">

# 以下のマッチはまず .* が Quote" にマッチした後、
# 正規表現末尾の " のマッチに失敗します。その後
# 一文字だけバックトラックして、" のマッチに成功します。
p /".*"/.match('"Quote"') # => #<MatchData "\"Quote\"">
# 一方、以下のマッチはまず .* が Quote" 全体にマッチした後、
# 正規表現末尾の " のマッチに失敗します。その後
# バックトラックで"がマッチした状態まで戻り、
# (?>.*)以外の選択子がないのでマッチ全体が失敗します。
p /"(?>.*)"/.match('"Quote"') # => nil
# 一方、以下のマッチはまず .* が Quote" 全体にマッチした後、
# 正規表現末尾の " のマッチに失敗します。その後
# バックトラックで"がマッチした状態まで戻り、
# 次の可能性(つまり | の右側)のマッチを試します。
# 結果としてマッチが成功します。
p /"(?:(?>.*)|(.*))"/.match('"Quote"') # => #<MatchData "\"Quote\"" 1:"Quote">

p /\A(?<paren>\(\g<paren>*\))*\z/ =~ '(())' # => 0
p /\A(?<a>|.|(?:(?<b>.)\g<a>\k<b+0>))\z/.match("rekxker")

r = Regexp.compile(<<'__REGEXP__'.strip, Regexp::EXTENDED)
(?<element> \g<stag> \g<content>* \g<etag> ){0}
(?<stag> < \g<name> \s* > ){0}
(?<name> [a-zA-Z_:]+ ){0}
(?<content> [^<&]+ (\g<element> | [^<&]+)* ){0}
(?<etag> </ \k<name+1> >){0}
\g<element>
__REGEXP__
p r.match('<foo>f<bar>bbb</bar>f</foo>').captures

p /\w(and|or)\w/.match("Feliformia") # => #<MatchData "form" 1:"or">
p /\w(and|or)\w/.match("furandi")    # => #<MatchData "randi" 1:"and">
p /\w(and|or)\w/.match("dissemblance") # => nil

# 文字列中の real にマッチする
p /real/.match("surrealist") # => #<MatchData "real">
# 先頭に real とないとマッチしない
p /\Areal/.match("surrealist") # => nil
# 単語境界がrealの前にないのでマッチしない
p /\breal/.match("surrealist") # => nil

# 以下の例では、後読みと先読みを使って <b> と
# </b> に挟まれているという条件を正規表現中に記述しつつ
# <b> </b> 自体にはマッチさせていない。
p /(?<=<b>)\w+(?=<\/b>)/.match("Fortune favours the <b>bold</b>")
# => #<MatchData "bold">
# 以下は上の正規表現と同じものを表す
p /<b>\K\w+(?=<\/b>)/.match("Fortune favours the <b>bold</b>")
# => #<MatchData "bold">

re = /\A(?:(set)|(print))\s+(\w+)(?(1)=(\d+))\z/
p re.match("set x=32") # => #<MatchData "set x=32" 1:"set" 2:nil 3:"x" 4:"32">
p re.match("print x") # => #<MatchData "print x" 1:nil 2:"print" 3:"x" 4:nil>
p re.match("set y") # => nil

p /a(?i:b)c/.match("aBc") # => #<MatchData "aBc">
p /a(?i:b)c/.match("abc") # => #<MatchData "abc">

/a(?i)bc/.match("aBc") # => #<MatchData "aBc">
/a(?i)bc/.match("aBC") # => #<MatchData "aBC">
# かっこの中で(?i)を指定すると、そのかっこの終わりまで有効
/a(?:(?i)bc)d/.match("aBCd") # => #<MatchData "aBCd">
/a(?:(?i)bc)d/.match("aBCD") # => nil

Regexp.new("abc", Regexp::IGNORECASE)                     # => /abc/i
Regexp.new("abc", Regexp::MULTILINE)                      # => /abc/m
Regexp.new("abc # Comment", Regexp::EXTENDED)             # => /abc # Comment/x
Regexp.new("abc", Regexp::IGNORECASE | Regexp::MULTILINE) # => /abc/mi

p /あいう/.encoding # => #<Encoding:UTF-8>
p /abc/.encoding # => #<Encoding:US-ASCII>
p /abc/u.encoding # => #<Encoding:UTF-8>

/あいう/.fixed_encoding? # => true
/abc/.fixed_encoding? # => false
/abc/e.fixed_encoding? # => true
/abc/ =~ "あいう" # => nil
#/abc/e =~ "あいう" #=> incompatible encoding regexp match (EUC-JP regexp with UTF-8 string) (Encoding::CompatibilityError)

float_pat = /\A
  \d+ # 整数部
  (\. # 小数点
    \d+ # 小数部
  )?  # 小数点 + 小数部 はなくともよい
\z/x
p float_pat.match("3.14") # => #<MatchData "3.14" 1:".14">

p /x y/x.match("x y") # => nil
p /x\ y/x.match("x y") # => #<MatchData "x y">

