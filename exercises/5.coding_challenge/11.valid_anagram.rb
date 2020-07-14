=begin
Given two strings s and t , write a function to determine if t is an anagram of s.

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
Example 2:

Input: s = "rat", t = "car"
Output: false
Note:
You may assume the string contains only lowercase alphabets.

Follow up:
What if the inputs contain unicode characters? How would you adapt your solution to such case?
=end

# time complexity: O(nlogn)(sorting) + O(n)(comparing)
# space complexity: O(1)(if sorting uses heap sort) or O(n) if char makes a  copy of the string
def valid_anagram(s, t)
  return false if s.length != t.length || s.empty? || t.empty?
  s_arr = s.chars.sort
  t_arr = t.chars.sort
  for i in 0...s_arr.length
    return false if s_arr[i] != t_arr[i]
  end
  true
end

# since its contains only asci values, we can increase the value corresponding to each 
# character in one iteration and decrease the same in the next. If counter is -ve, we return false

# time complexity: O(n)
# space complexity: O(1) Although we do use extra space, the space complexity is O(1) 
# because the table's size stays constant no matter how large n is. Space storage does
# not depend on input size ,a 256 sized array is sufficient for any size of input.
def valid_anagram_counter(s, t)
  return false if s.length != t.length || s.empty? || t.empty?
  
  counter_arr = Array.new(256, 0)
  
  #  can't check all of them together coz first string might have string that might add to the positive value
  for i in (0...s.length)
    counter_arr[s[i].ord] += 1
    counter_arr[t[i].ord] -= 1
  end
  
  counter_arr.each do |a|
    return false if a != 0
  end
  true
end

# 
def valid_anagram_hsh(s, t)
  str_hsh = {}
  for i in 0...s.length do
    str_hsh[s[i].ord] = (str_hsh[s[i].ord] || 0) + 1
    str_hsh[t[i].ord] = (str_hsh[t[i].ord] || 0) - 1
  end
  
  str_hsh.each do |k, v|
    return false if v != 0
  end
  true
end


s = "anagram"
t = "nagrama"
# t = ""

s1 = "rat"
t1 = "car"

puts valid_anagram(s, t)
puts valid_anagram(s1, t1)

puts valid_anagram_counter(s, t)
puts valid_anagram_counter(s1, t1)

puts valid_anagram_hsh(s, t)
puts valid_anagram_hsh(s1, t1)