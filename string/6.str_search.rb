# search for patterns in string using brute force 
# runtime of 0(n) in the best case when the string is exactly equal to the pattern
# O(mn) when string in the worst case
require_relative 'spec_helper'

class StrSearch
  def search(txt, pat)
    n = txt.length
    m = pat.length
    for i in (0..n-m) do
      j = 0
      for j in (0...m) do
        break if txt[i+j] != pat[j]
        return i if j == (m -1)# index of the match
      end
    end
    txt # no match return the original string
  end
end

str = StrSearch.new
assert_equal('abc', str.search('abc', 'xy'))
assert_equal(1, str.search('abcdefbcx', 'bcd'))
assert_equal(6, str.search('abcdefbcx', 'bcx'))
assert_equal(2, str.search('abc', 'c'))
assert_equal(0, str.search('abc', 'a'))