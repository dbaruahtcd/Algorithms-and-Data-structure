require_relative '../spec_helper'
# Use DFA to perform pattern matching. The DFA is constructed first
# from the pattern

# running time R*M (r unique characters, m is the pattern)
class KPM
  
  def construct_dfa(pattern)
    uniq_chars = pattern.split('').uniq.count
    m = pattern.length
    @dfa = Array.new(uniq_chars) { Array.new(m) }
    @dfa[pattern.chars[0]][0] = 1
    x = 0
    for j in (1...m)
      for c in (0...uniq_chars)
        @dfa[c][j] = @dfa[c][x] # copy mismatch cases
      end
      @dfa[pattern(j)][j] = j+1 # set match cases
      x = dfa[pattern.chars[j]][x] # update restart state
    end
  end
  
  # If in a state j and next char c == pat.char(j), go to j+1.
  # If in a state j and next char c != pat.char(j), then the last j-1 
  # characters of input are pat[1..j-1], followed by c.
  # x points to the column that would need to be copied over for the 
  # current character
  def search(text)
    n = text.length
    i,j = 0, 0
    for i in (0...n)
      for j in (0...m)
        j = @dfa[text[i]][j]
      end
      if (j == m)
        return (i - m)
      else
        return n
      end
    end
  end
end

text = "test string"
pattern = "str"

kpm = KPM.new
kpm.construct_dfa(pattern)
puts kpm.search(text)
