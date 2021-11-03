#!/usr/bin/env ruby

(1..5).each { break }

#pr = Proc.new { break } #=> break from proc-closure (LocalJumpError)
#(1..5).each(&pr)
