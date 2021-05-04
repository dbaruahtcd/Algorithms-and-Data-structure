=begin
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Examples
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""
=end

def clean_string(string)
  return '' if string.strip.empty?
  str_stack = []
  hash_stack = []
  string.chars.each do |str|
    str_stack.push(str) if str.downcase.match(/[a-z0-9=\-\+]/)
    str_stack.pop if str == '#'
  end
  str_stack.join() || ''
end

puts clean_string('abc##d')
puts clean_string('abc#d##c')
puts clean_string('abc##d######')