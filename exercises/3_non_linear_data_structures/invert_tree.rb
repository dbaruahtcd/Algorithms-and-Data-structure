=begin
Invert a binary tree.
Example:
Input:

     4
   /   \
  2     7
 / \   / \
1   3 6   9
Output:

     4
   /   \
  7     2
 / \   / \
9   6 3   1
=end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
  end
  
  def insert(val)
    insert_into(@root, val)
  end
  
  private 
  def insert_into(node, val)
    if node.nil?
      return TreeNode.new(val)
    end
    
    if node.left.nil?
      node.left = insert_into(node.left, val)
    elsif node.right.nil?
      node.right = insert_into(node.right, val)
    end
    node
  end
end

#The inverse of an empty tree is the empty tree. The inverse of a tree with root r, 
# and subtrees right and left, is a tree with root r, whose right subtree is the inverse of left, 
# and whose left subtree is the inverse of right.

# Since each node in the tree is visited only once, the time complexity is O(n), where n is 
# the number of nodes in the tree. We cannot do better than that, since at the very least we have to 
# visit each node to invert it.
# Because of recursion, O(h) function calls will be placed on the stack in the worst case, 
# where h is the height of the tree. Because h in O(n), the space complexity is O(n).

def invert_tree(node)
  return nil if node.nil?
  
  right = invert_tree(node.right)
  left = invert_tree(node.left)
  node.right = left
  node.left = right
  return node
end

def invert_tree_iterative(node)
  raise ArgumentError if node.nil?
  queue = Queue.new
  queue.enq(node)
  while(!queue.empty?)
    current = queue.deq
    # puts current.inspect
    temp = current.left
    current.left = current.right
    current.right = temp
    queue.enq(current.left) if(!current.left.nil?)
    queue.enq(current.right) if(!current.right.nil?)
  end
  node
end

root = TreeNode.new(1)
left1 = root.left = TreeNode.new(2)
right1 = root.right = TreeNode.new(3)
# left1.right = TreeNode.new(5)
# left1.left = TreeNode.new(4)
# right1.right = TreeNode.new(7)
# right1.left =  TreeNode.new(6)
puts "before: #{root.inspect}"
puts invert_tree(root).inspect
puts "before: #{root.inspect}"
puts invert_tree_iterative(root).inspect
# puts result.inspect
