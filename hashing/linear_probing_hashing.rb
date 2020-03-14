# Store keys and values in two separate arrays with an assumption that
# the array size would be twice the number of possible key value pairs
require '../spec_helper'

class LinearProbingHashing
  ARRAY_SIZE = 10000
  attr_reader :key_arr, :val_arr

  def initialize
    @key_arr = Array.new(ARRAY_SIZE)
    @val_arr = Array.new(ARRAY_SIZE)
  end

  def put(key, val)
    index = hash(key)
    while(index < ARRAY_SIZE)
      if key_arr[index].nil?
        key_arr[index] = key
        val_arr[index] = val
        break
      else
        index = (index + 1) % ARRAY_SIZE
      end
    end
  end

  def get(key)
    index = hash(key)
    while(index < ARRAY_SIZE)
      if key_arr[index] == key
        return val_arr[index]
      else
        index = (index + 1) % ARRAY_SIZE
      end
    end
  end

  private

  def hash(key)
    (key.hash && 0x7fffffff) % ARRAY_SIZE
  end
end

linear_hash = LinearProbingHashing.new
linear_hash.put('hen', 81)
assert_equal(81, linear_hash.get('hen'))
