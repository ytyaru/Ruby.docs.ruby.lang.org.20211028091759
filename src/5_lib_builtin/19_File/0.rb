#!/usr/bin/env ruby

File.open("testfile", "w", 0755) { |f| f.print "test" }
p File.read("testfile")  # => "test"

f = File.new("testfile", "r")
f.class # => File
f.close

f = File.open("testfile", "r")
f.class # => File
f.close

p $0        # /tmp/.../0.rb
p __FILE__  # /tmp/.../0.rb

p File.dirname($0)
p File.basename($0)
p File.basename($0).split('.')
p File.basename('0.0.1.rb').split('.')
p File.dirname('/tmp/0.0.1.rb')
p File.basename('/tmp/0.0.1.rb', '.*')
p File.extname('/tmp/0.0.1.rb')
p File.join(File.dirname('/tmp/0.0.1.rb'), File.basename('/tmp/0.0.1.rb', '.*') + File.extname('/tmp/0.0.1.rb'))
p File.absolute_path(__FILE__).split(File::SEPARATOR)
p File.absolute_path(__FILE__).split(File::SEPARATOR).join(File::SEPARATOR)

path = '/tmp/dir/0.0.1.txt'
p File.split(path)  # ["/tmp/dir", "file.txt"]
d, f = File.split(path)
p d
p f
p d.split(File::Separator)
p File.basename(path, '.*')
p File.extname(path)
p f.split('.')
p ['/tmp/dir/', '0.0.1', '.rb'].join
