#!/usr/bin/env -S ruby

def m(&b); yield b; end
m {p 'BLOCK'}

def n; yield; end
n {p 'BLOCK'}

eval "p 'P'"

def m
  raise
rescue => e
  p e
ensure
  p '終了'
end
m

def m
  begin
    raise
  rescue => e
    p e
  ensure
    p '終了'
  end
end
m

def m
  return 'RETURN'
  raise
rescue => e
  p e
  'RESCUE'
ensure
  p '終了'
  'ENSURE'
end
m

def m
  return 'RETURN'
  raise
rescue => e
  p e
  'RESCUE'
ensure
  p '終了'
  'ENSURE'
end
m

def m
  'RETURN'
  raise
rescue => e
  p e
  'RESCUE'
ensure
  p '終了'
  'ENSURE'
end
m

def m; end
m #=> nil

a = def m; end
a #=> :m

def m(&block)
  yield block
end
m {p 'BLOCK'}

def m
  yield
end
m {p 'BLOCK'}

def m
  yield
end
#m #=> no block given (yield) (LocalJumpError)

def m(times: 3)
  try = 0
  begin
    try += 1
    yield
  rescue
    retry if try < times
    raise
  end
end
m { p '実行' }
