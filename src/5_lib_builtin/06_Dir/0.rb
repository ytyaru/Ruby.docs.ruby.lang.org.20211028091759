#!/usr/bin/env ruby

p Dir.glob("*")                      #=> ["bar", "foo"]
p Dir.glob("*", File::FNM_DOTMATCH)  #=> [".", "..", "bar", "foo"]
Dir.glob('*') {|f| p f}

d = Dir.new('./')
p d
#p d['*'] #=> undefined method `[]' for #<Dir:./> (NoMethodError)

Dir.chdir('/tmp')
p Dir.pwd #=> /tmp
Dir.chdir('/tmp/work') {|path|
  p path #=> /tmp/work
  p Dir.pwd #=> /tmp/work
}
p Dir.pwd #=> /tmp

p Dir.children('/tmp/work')
p Dir.children('/tmp/work', encoding:Encoding::UTF_8)

Dir.open('.'){|d|
  p d.children # => ["bar", "foo"]
}
Dir.each_child('.'){|f|
  p f #=> bar foo
}
p Dir.entries('.') #=> [".", "..", "bar", "foo"]
p Dir.foreach('.').to_a
Dir.foreach('.'){|f| p f}

#Dir.chroot("./") # Operation not permitted @ dir_s_chroot - ./ (Errno::EPERM)

Dir.mkdir '/tmp/work/test'
Dir.delete '/tmp/work/test'

Dir.mkdir '/tmp/work/test'
Dir.rmdir '/tmp/work/test'

Dir.mkdir '/tmp/work/test'
Dir.unlink '/tmp/work/test'

d = '/tmp/work/test'
Dir.mkdir d
Dir.rmdir d if Dir.empty? d

d = '/tmp/work/test'
Dir.mkdir d unless Dir.exist? d
Dir.mkdir d unless File.directory? d
Dir.rmdir d if Dir.empty? d

Dir.chdir("/tmp")   #=> 0
p Dir.getwd           #=> "/tmp"
p Dir.pwd             #=> "/tmp"

p Dir.home
p Dir.home 'root'

Dir.new('/tmp') {|dir| p dir}
Dir.open('/tmp') {|dir| p dir}

