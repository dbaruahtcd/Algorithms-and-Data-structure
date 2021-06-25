=begin
Please write a function that will take a string as input and return a hash. The string will be formatted as such. The key will always be a symbol and the value will always be an integer.

"a=1, b=2, c=3, d=4"
This string should return a hash that looks like

{ :a => 1, :b => 2, :c => 3, :d => 4}
=end
require '../../spec_helper'

def str_to_hash(str)
  hsh = {}
  return hsh if str.empty?
  str = str.split(',').map(&:strip)
  str.each do |s|
    key = s[0].to_sym
    val = s[2].to_i
    hsh[key] = val
  end
  hsh
end

def str_to_hsh_regex(str)
  hsh = {}
  return hsh if str.empty?
  keys = str.scan(/[a-z]/)
  val = str.scan(/[0-9]+/)
  for i in (0...keys.length)
    hsh[keys[i].to_sym] = val[i].to_i
  end
  hsh
end

# puts str_to_hash("a=1, b=2, c=3, d=4")
# puts str_to_hsh_regex("a=1, b=2, c=3, d=4")
puts str_to_hash("a=1, b=12")
puts str_to_hsh_regex("a=1, b=12")

# assert_equal(str_to_hash("a=1, b=2, c=3, d=4"),{ :a => 1, :b => 2, :c => 3, :d => 4})
# assert_equal(str_to_hash("a=1, b=12"), { :a => 1, :b => 12})
# assert_equal(str_to_hash(""),{ })

# assert_equal(str_to_hsh_regex("a=1, b=2, c=3, d=4"),{ :a => 1, :b => 2, :c => 3, :d => 4})
# assert_equal(str_to_hsh_regex(""),{ })