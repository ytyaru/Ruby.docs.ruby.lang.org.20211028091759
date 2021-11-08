#!/usr/bin/env ruby

# 二乗して偶数になるような整数を、小さい方から5個表示する
p 1.step.lazy.select{|n| (n**2).even?}.first(5)
# LTSV (http://ltsv.org/) 形式のログファイルから検索を行う
# Enumerator::Lazy#map は配列ではなく Enumerator を返すため、
# 巨大な配列を確保しようとしてメモリを使い切ったりはしない
$HERE = File.expand_path('../', __FILE__)
p $HERE
Dir.chdir($HERE)
open("log.txt"){|f|
  f.each_line.lazy.map{|line|
    Hash[line.split(/\t/).map{|s| s.split(/:/, 2)}]
  }.select{|hash|
    hash["req"] =~ /GET/ && hash["status"] == "200"
  }.each{|hash|
    p hash
  }
}

module Enumerable
  def filter_map(&block)
    map(&block).compact
  end
end
class Enumerator::Lazy
  def filter_map
    Lazy.new(self) do |yielder, *values|
      result = yield *values
      yielder << result if result
    end
  end
end
p 1.step.lazy.filter_map{|i| i*i if i.even?}.first(5)
# => [4, 16, 36, 64, 100]

