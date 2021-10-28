#!/usr/bin/env -S ruby

=begin
複数行のコメントが書ける。
が、スタイルガイドによると
#による１行コメントが推奨らしい。
=end

begin
  p 'begin-end'
end

BEGIN { p 'BEGIN' }
END { p 'END' }

