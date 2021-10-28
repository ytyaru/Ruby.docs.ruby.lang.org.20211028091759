# クラスです。
class C
  # コンストラクタです。インスタンス変数<code>@iv</code>を定義します。
  def initialize; @iv=nil; end
  # メソッドです。
  def m; :m; end
end
if __FILE__ == $0
  p C.new.m
end
