=begin
Write an algorithm to determine if a number n is "happy".

A happy number is a number defined by the following process: Starting with any positive integer, replace the number 
by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), 
or it loops endlessly in a cycle which does not include 1. Those numbers for which this process ends in 1 are happy numbers.

Return True if n is a happy number, and False if not.

Example: 

Input: 19
Output: true
Explanation: 
1^2 + 9^2 = 82
8^2 + 2^2 = 68
6^2 + 8^2 = 100
1^2 + 0^2 + 0^2 = 1
=end


# We can have three possible outcomes for this problem. 1> We eventually reach 1 <2> we are stuck in a cycle. 3> We reach infinity
# We could ignore the third case because of the explanation below
# Largest 1 digit = 9 -next> 81
# Largest 2 digit = 99 -next> 162
# Largest 3 digit = 999 -next> 243
# Largest 4 digit = 9999 -next> 324
# Largest 13 digit = 9*13 -next> 1053

# We can see that we don't have to deal with the infinity case. Every 4 digit number we eventually become a 3 digit number and will either 
# be stuck in a loop or reach 1. 

# The solution consist of computing the sum and then check if we have already come across that number. We use a set for storing the number
# If the current number has already been encountered we return false


require 'Set'

# Time complexity: O(logn) The number of digits in a number is given by log(n) and we are processing each digit in the number
# Space complexity: Closely related to the time complexity, and is a measure of what numbers we're putting in the HashSet, 
# and how big they are. For a large enough n, the most space will be taken by n itself.
def is_happy(n)
  seen = Set.new
  while(n != 1 && !seen.include?(n))
    seen.add(n)
    n = calculate_sum(n)
  end
  n == 1
end

def calculate_sum(n)
  sum = 0
  while(n > 0)
    sum += (n%10) ** 2
    n = n/10
  end
  sum
end

# The problem can be extrapolated into a problem whereby we try to find cycles in a Linked List using a fast and slow pointer. 
# If there is a cycle the faster will eventually catch up the slower. Else the faster would reach 1 first.
# Floyd's Cycle-Finding Algorithm
# TC: O(logn)
# SC: For this approach, we don't need a HashSet to detect the cycles. The pointers require constant extra space.
def is_happy_ll(n)
  slow_runner = n
  fast_runner = calculate_sum(n)
  while(fast_runner != 1 && fast_runner != slow_runner)
    slow_runner = calculate_sum(slow_runner)
    fast_runner = calculate_sum(calculate_sum(fast_runner))
  end
  fast_runner == 1
end

n = 19 # true
n1 = 7 # true
n2 = 116 # false
puts is_happy(n)
puts is_happy(n1)
puts is_happy(n2)
puts is_happy_ll(n)
puts is_happy_ll(n1)
puts is_happy_ll(n2)
