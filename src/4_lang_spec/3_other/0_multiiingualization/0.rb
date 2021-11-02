#!/usr/bin/env ruby

p __ENCODING__

p "いろは".encode("Shift_JIS")
p  "\xA4\xA4\xA4\xED\xA4\xCF".force_encoding("EUC-JP")
p Encoding.list

