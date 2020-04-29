require_relative '../spec_helper'
require 'prime'

class RabinKarp
  def initialize(pattern)
    @m = pattern.length
    @r = 256 # radix
    @q = Prime.take_while { |p| p < 1000 }.last # 997
    @rm = 1 # r^(m - 1) % 1
    for i in (1...@m)
      @rm = (@r * @rm) % @q
    end
    @pat_hash = hash(pattern, @m)
  end
  
  def hash(key, length)
    h = 0
    for i in (0...length)
      h = (@r * h + key[i].to_i) % @q
    end
    h
  end
  
  def search(text)
    n = text.length
    txt_hash = hash(text, @m)
    return 0 if(@pat_hash == txt_hash)
    for i in (@m..n)
      txt_hash = (txt_hash + @q - @rm* text[i-@m].to_i % @q) % @q
      txt_hash = (txt_hash * @r + text[i].to_i) % @q
      return i - @m + 1 if(@pat_hash == txt_hash)
    end
    return n
  end
end

pattern = '234'
text ='12345'

rk = RabinKarp.new(pattern)
assert_equal(1, rk.search(text))