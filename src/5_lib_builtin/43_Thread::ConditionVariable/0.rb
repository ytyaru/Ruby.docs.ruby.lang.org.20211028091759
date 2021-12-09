#!/usr/bin/env ruby
require 'thread'

class TinyQueue
  def initialize(max=2)
    @max = max
    @full = ConditionVariable.new
    @empty = ConditionVariable.new
    @mutex = Mutex.new
    @q = []
  end

  def count
    @q.size
  end

  def enq(v)
    @mutex.synchronize{
      @full.wait(@mutex) if count == @max
      @q.push v
      @empty.signal if count == 1
    }
  end

  def deq
    @mutex.synchronize{
      @empty.wait(@mutex) if count == 0
      v = @q.shift
      @full.signal if count == (@max - 1)
      v
    }
  end

  alias send enq
  alias recv deq
end

if __FILE__ == $0
  q = TinyQueue.new(1)
  foods = 'Apple Banana Strawberry Udon Rice Milk'.split
  l = []

  th = Thread.new {
    for obj in foods
      q.send(obj)
      print "sent ", obj, "\n"
    end
    q.send nil
  }

  l.push th

  th = Thread.new {
    while obj = q.recv
      print "recv ", obj, "\n"
    end
  }
  l.push th

  l.each do |t|
    t.join
  end
end
