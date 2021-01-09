=begin
In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

The town judge trusts nobody.
Everybody (except for the town judge) trusts the town judge.
There is exactly one person that satisfies properties 1 and 2.
You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.

If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.

 

Example 1:

Input: N = 2, trust = [[1,2]]
Output: 2
Example 2:

Input: N = 3, trust = [[1,3],[2,3]]
Output: 3
Example 3:

Input: N = 3, trust = [[1,3],[2,3],[3,1]]
Output: -1
Example 4:

Input: N = 3, trust = [[1,2],[2,3]]
Output: -1
Example 5:

Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
Output: 3
 

Constraints:

1 <= N <= 1000
0 <= trust.length <= 10^4
trust[i].length == 2
trust[i] are all different
trust[i][0] != trust[i][1]
1 <= trust[i][0], trust[i][1] <= N
=end
require '../../spec_helper'
# Solution 1. Making use of in degree and outdegree to find the judge
# Time complexity
# We loop over the trust list once. The cost of doing this is O(E).
# We then loop over the people. The cost of doing this is O(N)O(N).
# Going by this, it now looks this is one those many graph problems where the 
# cost is O(\max(N, E) = O(N + E)O(max(N,E)=O(N+E). After all, we don't know whether E or N is the bigger one, right?
# However, remember how we terminate early if E < N - 1E<N−1? This means that in the best case, 
# the time complexity is O(1). And in the worst case, we know that E ≥ N - 1E≥N−1. 
# For the purpose of big-oh notation, we ignore the constant of 1. Therefore, in the worst case, E has to be bigger, and so we can simply drop the NN, leaving O(E).

# Space Complexity : O(N)
# We allocated 2 arrays; one for the indegrees and the other for the outdegrees. Each was of length N + 1. Because in big-oh notation we drop constants, this leaves us with O(N)O(N).
# Since a judge can't trust anyone else and everyone should trust the judge, instead of trying to solve the problem
# with graph, we can do it by just iterating over the array, and finding the in and outdegree of each nodes. 
# The judge node will be the one with 0 in degree and n-1 outdegree.

def find_judge(n, trust)
  return -1 if trust.length < n - 1
  return n if trust.empty?
  
  indegree = Array.new(n+1, 0)
  outdegree = Array.new(n+1, 0)
  trust.each do |r|
    outdegree[r[0]] += 1
    indegree[r[1]] += 1
  end
  
  (0..n).each do |i|
    return i if (outdegree[i] == 0 && indegree[i] == (n - 1)) 
  end
  -1 
end

# Improvement
# Instead of using two arrays we could instead use a single array and increment each node with each indegree and 
# decrement with each outdegree. The node whose value equals n-1, will be the judge node.

def find_judge_imp(n, trust)
  return -1 if trust.length < n - 1
  return n if trust.empty?
  
  degree = Array.new(n+1, 0)
  trust.each do |t|
    degree[t[0]] -= 1
    degree[t[1]] += 1
  end 
  
  (0..n).each do |i|
    return i if degree[i] == n-1
  end
  return -1
end

n = 3
trust = [[1,3],[2,3],[3,1]]

n1 = 4
trust1 = [[1,3],[1,4],[2,3],[2,4],[4,3]]

assert_equal(find_judge(n, trust), -1)
assert_equal(find_judge(n1, trust1), 3)

assert_equal(find_judge_imp(n, trust), -1)
assert_equal(find_judge_imp(n1, trust1), 3)