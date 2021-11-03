#!/usr/bin/env ruby

def foo
  Proc.new { return }
end

foo.call
# => in `call': return from proc-closure (LocalJumpError)
