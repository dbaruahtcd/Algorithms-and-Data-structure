=begin
Complete the solution so that it reverses all of the words within the string passed in.

Example:

"The greatest victory is that which requires no battle" --> "battle no requires which that is victory greatest The"
=end

def solution(sentence)
  return sentence if sentence.strip.empty?
  sentence_arr = sentence.split(' ')
  sentence_arr.reverse.join(' ')
end

sentence = "The greatest victory is that which requires no battle"
puts solution(sentence)