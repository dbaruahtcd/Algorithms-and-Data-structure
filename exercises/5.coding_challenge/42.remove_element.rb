=begin
Given an array nums and a value val, remove all instances of that value in-place and return the new length.

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

The order of elements can be changed. It doesn't matter what you leave beyond the new length.

Clarification:

Confused why the returned value is an integer but your answer is an array?

Note that the input array is passed in by reference, which means a modification to the input array will be known to the caller as well.

Internally you can think of this:

// nums is passed in by reference. (i.e., without making a copy)
int len = removeElement(nums, val);

// any modification to nums in your function would be known by the caller.
// using the length returned by your function, it prints the first len elements.
for (int i = 0; i < len; i++) {
    print(nums[i]);
}
 

Example 1:

Input: nums = [3,2,2,3], val = 3
Output: 2, nums = [2,2]
Explanation: Your function should return length = 2, with the first two elements of nums being 2.
It doesn't matter what you leave beyond the returned length. For example if you return 2 with nums = [2,2,3,3] or nums = [2,2,0,0], your answer will be accepted.
Example 2:

Input: nums = [0,1,2,2,3,0,4,2], val = 2
Output: 5, nums = [0,1,4,0,3]
Explanation: Your function should return length = 5, with the first five elements of nums containing 0, 1, 3, 0, and 4. Note that the order of those five elements can be arbitrary. It doesn't matter what values are set beyond the returned length.
 

Constraints:

0 <= nums.length <= 100
0 <= nums[i] <= 50
0 <= val <= 100
=end

# When we encounter nums[i] = valnums[i]=val, we can swap the current element out with the last element and 
# dispose the last one. This essentially reduces the array's size by 1.
# Note that the last element that was swapped in could be the value you want to remove itself.
 # But don't worry, in the next iteration we will still check this element.

# Space complexity: O(n)
# Time complexity: O(1)
require '../../spec_helper'

def remove_element(nums, val)
  len = nums.length
  i = 0
  while(i < len)
    if nums[i] == val
      nums[i] = nums[len-1]
      len -= 1
    else
      i += 1
    end
  end
  len
end

# We have two pointers one fast and the other slow. The slow one is the current length of the array,
# while the fast pointer moves through the array. If arr[j] != val, we copy arr[j] into arr[i] and increment i
# Running time O(n)
# Space complexity: O(1)
def remove_element_impd(nums, val)
  i = 0
  for j in (0...nums.length) 
    if(nums[j] != val)
      nums[i] = nums[j]
      i+= 1
    end
  end
  i
end

nums = [3,2,2,3]
val = 3

nums2 = [0,1,2,2,3,0,4,2]
val2 = 2

nums3 = [2,2,3]
val3 = 2

nums4 = [0,4,4,0,4,4,4,0,2]
val4 = 4

# assert_equal(remove_element(nums, val), 2)
# assert_equal(remove_element(nums2, val2), 5)
# assert_equal(remove_element(nums3, val3), 1)
# assert_equal(remove_element(nums4, val4), 4)

assert_equal(remove_element_impd(nums, val), 2)
assert_equal(remove_element_impd(nums2, val2), 5)
assert_equal(remove_element_impd(nums3, val3), 1)
assert_equal(remove_element_impd(nums4, val4), 4)
