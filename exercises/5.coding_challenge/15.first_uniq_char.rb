=begin
Given a string, find the first non-repeating character in it and return its index. If it doesn't exist, return -1.

Examples:

s = "leetcode"
return 0.

s = "loveleetcode"
return 2.
=end

# time complexity: O(n^2)
# Space complexity: O(1)
def first_uniq_char(s)
  for i in 0...s.length
    for j in 0...s.length
      next if i == j
      break if s[i] == s[j]
      return s.chars.index(s[i]) if j == s.length - 1 && s[j] != s[i]
    end
  end
  -1
end

# Running time : O(n)
# space complexity: O(1) because the alphabet is fixed
def first_uniq_char_improved(s)
  hsh = {}
  s.each_char do |c|
    hsh.include?(c) ? hsh[c] += 1 : hsh[c] = 1

  end
  hsh.each do |k, v|
    return s.chars.index(k) if v == 1
  end
  -1
end


s = "leetcode"
s1 = "loveleetcode"
s2 = 'ggee'

puts first_uniq_char(s)
puts first_uniq_char(s1)
puts first_uniq_char(s2)

puts first_uniq_char_improved(s)
puts first_uniq_char_improved(s1)
puts first_uniq_char_improved(s2)