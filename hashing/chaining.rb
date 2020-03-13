# Hashing implementation where we use separate linked list to
# store elements

require_relative '../spec_helper'

class ChainingHash
  ARRAY_SIZE = 97

  def initialize
    @chain_hash_arr = Array.new(ARRAY_SIZE)
  end

  def put(key, val)
    index = hash(key)
    curr_node = @chain_hash_arr[index]
    while(curr_node)
      if curr_node.key == key
        curr_node.val = val
        break
      else
        curr_node = curr_node.next
      end
    end
    @chain_hash_arr[index] = Node.new(key, val, @chain_hash_arr[index])
  end

  def get(key)
    index = hash(key)
    curr_node = @chain_hash_arr[index]
    while(curr_node)
      (curr_node.key == key) ? (return curr_node.val) : (curr_node = curr_node.next)
    end
    return nil
  end

  private

  def hash(key)
    (key.hash && 0x7fffffff) % ARRAY_SIZE
  end

  class Node
    attr_accessor :key, :val, :next

    def initialize(key, val, nxt=nil)
      @key = key
      @val = val
      @next = nxt
    end
  end
end

chain_hash = ChainingHash.new
chain_hash.put('P', 34)
chain_hash.put('P', 44)
chain_hash.put('a', 66)
assert_equal(44, chain_hash.get('P'))
assert_equal(66, chain_hash.get('a'))
assert_equal(nil, chain_hash.get('not there'))
