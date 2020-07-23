=begin
You are climbing a stair case. It takes n steps to reach to the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

Example 1:

Input: 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
Example 2:

Input: 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
 
Constraints:

1 <= n <= 45
=end

# In this brute force approach we take all possible step combinations i.e. 1 and 2, at every step
# Time complexity: O(2^n) At each tree level there are 2^level nodes
# Space complexity: O(n) The depth of the recursion tree can go upto n
def climb_stairs(n)
  climb_stairs_helper(0, n)
end

def climb_stairs_helper(i, n)
  return 0 if i > n
  return 1  if i == n

  return climb_stairs_helper(i+1, n) + climb_stairs_helper(i+2, n)
end

# In the previous approach we are redundantly calculating the result for every step. Instead, we can store the 
# result at each step in memomemo array and directly returning the result from the memo array whenever that function is called again.

# Time complexity: O(n) Size of recursion tree can go upto n.
# Space complexity: O(n) The depth of recursion tree can go upto n.
# In this way we are pruning recursion tree with the help of memo array and reducing the size of recursion tree upto n.
def climb_stairs_memo(n)
  memo = []
  climb_stairs_memo_helper(0, n, memo)
end

def climb_stairs_memo_helper(i, n, memo)
  return 0 if i > n
  return 1 if i == n
  return memo[i] if (memo[i] || 0) > 0
  memo[i] = climb_stairs_memo_helper(i+1, n, memo) + climb_stairs_memo_helper(i+2, n, memo)
  return memo[i]
end


# Dynamic programming
# We can reach the ith step in two ways
# Taking a single step from the (i-1)th step and two steps from (i-2) step
# So the total number of ways of reaching ith step = # of ways of reaching (i-1)th + (i-2)th
# Time complexity: O(n) Single loop upto n
# Space complexity: O(n) the size of dp in n
def climb_stairs_dp(n)
  return 1 if n==1
  dp = []
  dp[1] = 1
  dp[2] = 2
  for i in (3..n) do
    dp[i] = dp[i-2] + dp[i-1]
  end
  dp[n]
end

# The above problem can also be implemented as a fibonacci sequence
# Time complexity : O(n). Single loop upto n is required to calculate nth fib number 
# Space complexity : O(1). Constant space is used.

def climb_stairs_fib(n)
  return 1 if n == 1
  first = 1
  second = 2
  for i in 3..n do
    third = first + second
    first = second
    second = third
  end
  second
end

puts climb_stairs(2)
puts climb_stairs(3)
puts climb_stairs_memo(2)
puts climb_stairs_memo(3)
puts climb_stairs_dp(2)
puts climb_stairs_dp(3)
puts climb_stairs_fib(2)
puts climb_stairs_fib(3)
