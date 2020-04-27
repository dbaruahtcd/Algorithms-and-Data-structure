require_relative '../spec_helper'
# R way tries. Provides ordered operations on strings
# Performs better than hashing because it doesn't need look at 
# the entire string length. 
# Store characters in nodes(not keys) and each node has R children 
# one for each possible characters

# One drawback is having to create array that's not full used
# for each node of the array

# For search miss need to examine only a few characters(sub linear performance)
# R-way trie good choice for small R, too much memory for large R(65536 for Unicode) 

class RTriesST
  attr_accessor :root
  def r_tries_st
    @root = Node.new
  end
  
  # Follow links corresponding to each character in the key
  # Encounter a null link: create new node
  # Encounter the last character of the key: set value in that node
  def put(key, value)
    @root = put_rec(@root, key, value, 0)
  end
  
  # Search hit : Node where search ends has a non null value
  # Search miss: Reach a node with null links or node where search ends has null value
  def get(key)
    node = get_rec(@root, key, 0)
    return nil if node.nil?
    return node.value
  end
  
  class Node
    attr_accessor :value, :next
    ASCII_RANGE = 256
    
    def initialize
      @next = Array.new(ASCII_RANGE)
    end
  end
  
  private
  # d is the depth of the current node in the trie
  def put_rec(node, key, value, d)
    node = Node.new if node.nil?
    if(d == key.length) 
      node.value = value
      return node
    end
    c_index = key[d].ord
    node.next[c_index] = put_rec(node.next[c_index], key, value, d+1)
    return node
  end
  
  def get_rec(node, key, d)
    return nil if node.nil?
    return node if (d == key.length)
    c_index = key[d].ord
    return get_rec(node.next[c_index], key, d+1)
  end
end

tries = RTriesST.new
tries.put('windows', 5)
tries.put('mac', 7)
tries.put('linux', 9)

assert_equal(5, tries.get('windows'))
assert_equal(7, tries.get('mac'))
assert_equal(9, tries.get('linux'))
assert_equal(nil, tries.get('stalman'))

