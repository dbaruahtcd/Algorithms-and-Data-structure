=begin
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
An input string is valid if:
Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
=end

require '../../spec_helper'

# use a stack to keep track of what has been seen so far and then once a corresponding closing 
# symbol matches, we pop it off the stack
# Running time O(n), just traversing the list one character at a time. Pushing and popping are O(1) operation
# Space complexity is O(n) in the worst case
def is_valid?(s)
  stack = []
  mapping = { 
    '}' => '{',
    ']' => '[',
    ')' => '('
  }
  s.chars.each do |c|
    if mapping.has_key?(c) && !stack.empty? && stack.last == mapping[c]
      stack.pop
    else
      stack.push(c)
    end
  end
  return stack.empty?
end

valid = '(((((())))))'
invalid = '(((((((()'

valid_comb = '{[[]{}]}()()'
invalid_comb = '{[[](]}()()'

assert(is_valid?(valid))
assert(!is_valid?(invalid))
assert(is_valid?(valid_comb))
assert(!is_valid?(invalid_comb))

