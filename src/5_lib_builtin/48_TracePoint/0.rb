#!/usr/bin/env ruby
trace = TracePoint.new(:call) do |tp|
    p [tp.lineno, tp.defined_class, tp.method_id, tp.event]
end
p trace
# => #<TracePoint:0x007f17372cdb20>
p trace.enable
# => false
puts "Hello, TracePoint!"
# ...
# [69, IRB::Notifier::AbstractNotifier, :printf, :call]
# ...
