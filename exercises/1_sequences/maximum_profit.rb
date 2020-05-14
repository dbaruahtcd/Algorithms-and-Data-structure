# Say you have an array for which the ith element is the price of a given stock on day i.
# If you were only permitted to complete at most one transaction (i.e., buy one and sell 
# one share of the stock), design an algorithm to find the maximum profit.
# Note that you cannot sell a stock before you buy one.
require '../../spec_helper'

# We need to find the max profit amongst the differences between the numbers in the array
# Running time O(n^2)
# Space complexity: O(1)
def max_profit_brute(num)
  max_profit = 0
  for i in (0...num.length-1)
    for j in (i+1...num.length)
      profit = num[j] - num[i]
      max_profit = profit if profit > max_profit
    end
  end
  max_profit
end


# We make one pass and keep track of the min seen so far and the maxprofit till now
# Running time O(n)
# Space complexity O(1)
def max_profit(num)
  min_val = (2 ** ((0.size * 8) - 1) - 1) # max signed int value
  max_profit = 0
  for i in (0...num.length)
    if num[i] < min_val
      min_val = num[i]
    end
    if max_profit < num[i] - min_val
      max_profit = num[i] - min_val
    end
  end
  max_profit
end

num = [7,1,5,3,6,4]
assert_equal(5, max_profit_brute(num))
assert_equal(5, max_profit(num))

num1 = [1,5,3,6,4]
assert_equal(5, max_profit_brute(num))
assert_equal(5, max_profit(num))