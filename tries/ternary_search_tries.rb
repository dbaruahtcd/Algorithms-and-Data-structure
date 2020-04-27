# Store characters and values in nodes(not keys)
# Each node has 3 children smaller(left), equal(middle), larger(right)
require_relative '../spec_helper'
require 'byebug'

class TST
  # Root doesn't need to be initialize, otherwise the first str comparision fails
  
  def put(key, value)
    @root = put_rec(@root, key, value, 0)
  end
  
  # Follow links corresponding to each character in the key
  # If less, take left link, if greater take right link
  # If equal take middle link and move to the next key character
  # Search hit: Node where search end has a non null value
  # Search miss: Reach a null link or node where search ends has null value
  def get(key)
    node = get_rec(@root, key, 0)
    return nil if node.nil?
    return node.value
  end
  
  class Node
    attr_accessor :char, :value, :left, :mid, :right
  end
  
  private
  def put_rec(node, key, value, d)
    char_at = key[d]
    if(node.nil?)
      node = Node.new
      node.char = char_at
    end
    # debugger
    if (char_at < node.char)
      node.left = put_rec(node.left, key, value, d)
    elsif (char_at > node.char)
      node.right = put_rec(node.right, key, value, d)
    elsif(d < key.length - 1)
      node.mid = put_rec(node.mid, key, value, d + 1)
    else 
      node.value = value
    end
    node
  end
  
  def get_rec(node, key, d)
    return if node.nil?
    char_at = key[d]
    if char_at < node.char
      return get_rec(node.left, key, d)
    elsif char_at > node.char
      return get_rec(node.right, key, d)
    elsif d < key.length - 1
      return get_rec(node.mid, key, d + 1)
    else
      return node
    end
  end
end

tries = TST.new
tries.put('windows', 5)
tries.put('mac', 7)
tries.put('linux', 9)

assert_equal(5, tries.get('windows'))
assert_equal(7, tries.get('mac'))
assert_equal(9, tries.get('linux'))
assert_equal(nil, tries.get('stalman'))
