#!/usr/bin/env ruby
p RubyVM::InstructionSequence.compile("a = 1 + 2")

p = proc { num = 1 + 2 }
puts RubyVM::InstructionSequence.disasm(p)
