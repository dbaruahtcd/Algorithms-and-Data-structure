require_relative '../spec_helper'

class BasicStringSearch
  #check for pattern starting at each position  
  def self.search(pattern, text)
    n = text.length
    m = pattern.length
    i = 0
    for i in (0..(n-m))
      for j in (0...m)
        if text[i+j] != pattern[j]
          break
        end
        return i if (j == m - 1 )
      end
    end
    n
  end
end

str = 'This O(M*N) algo is a precursor to much better sub string searching algorithm'
pattern = 'algorithm'

assert_equal(68, BasicStringSearch.search(pattern, str))