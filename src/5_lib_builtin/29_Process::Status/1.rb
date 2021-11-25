#!/usr/bin/env ruby
trap(:SIGCHLD) {|sig|

  puts "interrupted by signal #{sig} at #{caller[1]}"
  # 複数の子プロセスの終了に対して1つの SIGCHLD しか届かない
  # 場合があるのでループさせる必要があります

  while Process.waitpid(-1, Process::WNOHANG|Process::WUNTRACED)
    case
    when $?.signaled?
      puts "   child #{$?.pid} was killed by signal #{$?.termsig}"
      if $?.coredump?
        puts "   child #{$?.pid} dumped core."
      end
    when $?.stopped?
      puts "   child #{$?.pid} was stopped by signal #{$?.stopsig}"
    when $?.exited?
      puts "   child #{$?.pid} exited normally. status=#{$?.exitstatus}"
    else
      p "unknown status %#x" % $?.to_i
    end
  end
}

p pid1 = fork { sleep 1; exit }
p pid2 = fork { loop { sleep } } # signal を待つための sleep
begin
   Process.kill :STOP, pid2
   sleep                      # SIGCHLD を待つための sleep
   Process.kill :CONT, pid2
   Process.kill :TERM, pid2
   loop { sleep }             # SIGCHLD を待つための sleep
rescue Errno::ECHILD
  puts "done"
end
