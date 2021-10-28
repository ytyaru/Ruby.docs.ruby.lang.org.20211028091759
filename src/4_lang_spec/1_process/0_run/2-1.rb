#!/usr/bin/env -S ruby

unless false; p 'T'; end

unless false
  p 'T'
end

unless false
  p 'T'
else
  p 'F'
end

x = unless false
  'T'
else
  'F'
end
p x


p 'T' unless false

a = [1,2,3].each {|i| p i} unless false 
def fair_play?; false; end
point = 0
point -= 1 unless fair_play?
p point

def open_file
  # ファイルが存在しないなら処理中断
  return unless exist?
end

def open_file
  # ファイルが存在しないなら例外発生
  raise NotFoundError unless exist?
end

