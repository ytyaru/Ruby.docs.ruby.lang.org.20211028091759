#!/usr/bin/env -S ruby

p 123
p 0d123
p -123
p 123.45
p 1.2e-3
p 0xffff
p 0b1011
p 0377
p 0o377
p 42r
p 3.14r
p 42i
p 3.14i
p 42ri
p 3.14ri

p "this is a string expression\n"
p 'this is a string expression\n'
p %q!I said, "You said, 'She said it.'"!
p %!I said, "You said, 'She said it.'"!
p %Q('This is it.'\n)
p "this is multi line
string"
p "foo" "bar"

$ruby = "RUBY"
p "my name is #{$ruby}" #=> "my name is RUBY"
p 'my name is #{$ruby}' #=> "my name is #{$ruby}"

# 式展開中の式は、ダブルクォートなども含めて Ruby の式をそのまま書くことができます。コメントも許されます。
# p "#{ "string" # comment }"   # => "string"
# 実行したら怒られたんですけど？
# syntax error, unexpected end-of-input, expecting '}'

# クォートはOKだけどコメントはNGっぽい
# "#{ "string" }" #=> OK
# "#{ # comment }" #=> NG

# 式展開中コメントは改行したらOKっぽい（可読性がさがるので使いたくない）
"#{$ruby # comment
}"

#p "#{ "string" # comment }"   # => "string"
#p "#{ "string" # comment
#}"                          # => "string"

# 文字リテラル
p ?a
p ?あ
p ?\u3042
p ?\C-a
p ?\M-a
p ?\M-\C-a

# コマンド出力
p `date`.chomp
p %x{ date }.chomp
p $?

# ヒアドキュメント (行指向文字列リテラル)
print <<EOS      # 識別子 EOS までがリテラルになる
  the string
  next line
EOS
print "  the string\n  next line\n"

# 式の中に開始ラベルを書く
# method の第二引数には "    ヒアドキュメント\n" が渡される
def method(arg1, label, args)
  p label
end
method(1, <<LABEL, 2)
    ヒアドキュメント
LABEL

# ヒアドキュメントをレシーバにメソッドを呼ぶ
p <<LABEL.upcase
the lower case string
LABEL

# 開始ラベルの次の行は常にヒアドキュメントとなります。例えば、以下のような記述は文法エラーになります
#printf('%s%d',
#       <<EOS,
#       3055 * 2 / 5)   # <- この行はヒアドキュメントに含まれてしまう
#This line is a here document.
#EOS

# 開始ラベルを `<<-識別子' のように `-' を付けて書くことで終端行をインデントすることができます。これ以外では、終端行に、余分な空白やコメントさえも書くことはできません。
if true
  puts <<-EOS   # '<<-' を使うと……
    def foo
      print "foo\n"
    end
  EOS
  #↑終端行をインデントできます。
end

# 開始ラベルを `<<~識別子` のように `~` を付けて書くことで、以下のようなヒアドキュメントを書くことができます。
expected_result = <<~SQUIGGLY_HEREDOC
  This would contain specially formatted text.

  That might span many lines
SQUIGGLY_HEREDOC
puts expected_result 

print <<FIRST, <<SECOND
   これは一つめのヒアドキュメントです。
   まだ一つめです。
FIRST
   この行からは二つめのヒアドキュメントです。
   この行で終わります。
SECOND

# バックスラッシュ記法、式展開が有効
price = 100
print <<"EOS"
The price is #{$price}.
EOS

# 上のものと同じ結果
print <<EOS
The price is #{$price}.
EOS

# 式展開はできない
print <<'EOS'
The price is #{$price}.
EOS

# コマンドを実行
print <<`EOC`
date
diff test.c.org test.c
EOC

# 正規表現リテラル
/^Ruby the OOPL/
/Ruby/i
myname = 'ytyaru'
/my name is #{myname}/o
%r|Ruby|

# 配列式
p [1, 2, 3]
p %w(a b c)
p %W(a b c)

# ハッシュ式
hash = {}
p hash
hash = {'key': 'value'}
p hash
hash = {'key' => 'value'}
p hash
hash = {key: 'value'}
p hash
hash = {:key => 'value'}
p hash
hash = { 1 => 2, 2 => 4, 3 => 6}
p hash
hash = { :a => "A", :b => "B", :c => "C" }
p hash
hash = { a:"A", b:"B", c:"C" }
p hash
hash = { "a":"A", 'b':"B", "c":"C" }
p hash
# メソッドの引数、もしくは配列式の末尾に要素が1つ以上のハッシュを渡す場合は、{, }を省略することができます。
#method(1,2,3=>4)      # method(1,2,{3=>4})
#obj[1=>2,3=>4]        # obj[{1=>2,3=>4}]
#[1=>2,3=>4]           # [{1=>2, 3=>4}]

# 範囲オブジェクト
p 1 .. 20
p (1..)
p (1...)
p Range.new(1,7)

5.times{|n|
  if (n==2)..(n==3)
    p n
  end
}

5.times{|n|
  if (n==2)...(n==3)
    p n
  end
}

# 「..」と「...」の違いを示すためだけの例
5.times{|n|
  if (n==2)..(n==2)
    p n
  end
}
5.times{|n|
  if (n==2)...(n==2)
    p n
  end
}

# and
p true && true
p true and true
p false and nil
p 1 && 2

# or
p true || true
p true or true
p false or nil
p 1 || 2

# not
p !true
p (not true)
p true != true
p true !~ true
p true =~ true

# 条件演算子
p true == true ? 1 : 2
p (if true == true; 1; else 2; end)

# シンボル
p :my_symbol
p :'my-symbol'
p :"my-symbol"
p %s{my-symbol}

# %記法
p %!ダブルクォート!
p %Q!ダブルクォート!
p %q!シングルクォート!
p %x!date! # コマンド
p %r!(正規表現|regular)!
name = 'ytyaru'
p %w!(ab cd ef gh #{name})!
p %W!(ab cd ef gh #{name})!
p %s!(#{name})!
p %i!(:sym1 :sym2 :sym3 :"#{name}")!
p %I!(:sym1 :sym2 :sym3 :"#{name}")!

p %?some? #=> "some"
p %$some$ #=> "some"
p %%some% #=> "some"
p %&some& #=> "some"
p %-some- #=> "some"

p %!name!
p %!#{name}!
