#!/usr/bin/env ruby

fork { exit }
Process.wait
case
when $?.signaled?
  p "child #{$?.pid} was killed by signal #{$?.termsig}"
  if $?.coredump?   # システムがこのステータスをサポートしてなければ常にfalse
    p "child #{$?.pid} dumped core."
  end
when $?.stopped?
  # 実際には Process.wait を使用しているので、ここに来ることはない
  p "child #{$?.pid} was stopped by signal #{$?.stopsig}"
when $?.exited?
  p "child #{$?.pid} exited normally. status=#{$?.exitstatus}"
else
  p "unknown status %#x" % $?.to_i
end

