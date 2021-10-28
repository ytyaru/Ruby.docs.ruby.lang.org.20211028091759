#!/usr/bin/env -S ruby

if true; p 'T'; end

if true
  p 'T'
end

if true
  p 'T'
else
  p 'F'
end

if true
  p 'T'
elsif true
  p 'E'
else
  p 'F'
end

x = if true
  'T'
elsif true
  'E'
else
  'F'
end
p x

p 'T' if true

a = [1,2,3].each {|i| p i} if true 
def clear?; true; end 
point = 0
point += 1 if clear?
p point

def make_file
  # ファイルが存在したら処理中断
  return if exist?
end
def make_file
  # ファイルが存在したら例外発生
  raise AlreadyExistError if exist?
end
