=begin
Design an algorithm to encode a list of strings to a string. The encoded 
string is then sent over the network and is decoded back to the original list of strings.
=end


# The intuition behind this is to use an non ascii value to delimit a blankspace that can then
# be decoded back to a space

# Time complexity: O(N) both for encode and decode, where N is the number of strings in the input array
# Space complexity: O(1) for encode to keep the output, since the output is only one string.
# O(N) for decode to keep the string, since the output is an array of strings
def encode_non_ascii_delimiter(str)
  return str if str.empty?
  # split would split the str without the specified delimiter while partition would output the delimiter as well
  partitioned_str = str.partition(' ') 
  delimiter = 257.chr(Encoding::UTF_8)
  encoded_str = ''
  partitioned_str.each do |s|
    if s == " "
      encoded_str+= delimiter 
    else
      encoded_str+= s
    end
  end
  encoded_str
end

def decode_non_ascii_delimiter(str)
  delimiter = 257.chr(Encoding::UTF_8)
  str.split(delimiter)
end

str = 'Sample string'
encoded_str = encode_non_ascii_delimiter(str)
# puts encoded_str
# puts "#{decode_non_ascii_delimiter(encoded_str)}"
puts decode_non_ascii_delimiter(encode_non_ascii_delimiter(str))