# Binary tree implementation performing
# Search, inserts
# Traversal(inorder, preorder, postorder)

require_relative 'tree_node'
require_relative '../spec_helper'

class BinaryTree
  attr_reader :root

  def initialize(val)
    @root = TreeNode.new(val)
  end

  def insert(val)
    insert_into(@root, val)
  end

  def curr_val
    TreeNode.val
  end

  def contains?(val)
    contains_recursive?(@root, val)
  end

  # Depth first seach goes deep as much as possible in every child before
  # exploring the next sibling
  def in_order
    traversal_in_order(@root)
  end

  def pre_order
    traversal_pre_order(@root)
  end

  def post_order
    traversal_post_order(@root)
  end

  def breadth_first_search
    traversal_breadth_first(@root)
  end

  # Delete needs to handle 3 scenarios
  # 1st: Node with no children
  # 2nd: Node with 1 child
  # 3rd: Node with two children
  def delete(val)
    @root = delete_recursive(@root, val)
  end



  private

  def traversal_in_order(node)
    unless(node.nil?)
      traversal_in_order(node.left)
      print " #{node.val}"
      traversal_in_order(node.right)
    end
  end

  def traversal_pre_order(node)
    unless(node.nil?)
      print " #{node.val}"
      traversal_pre_order(node.left)
      traversal_pre_order(node.right)
    end
  end

  def traversal_post_order(node)
    unless(node.nil?)
      traversal_post_order(node.left)
      traversal_post_order(node.right)
      print " #{node.val}"
    end
  end

  def traversal_breadth_first(node)
    bfs_queue = Queue.new
    bfs_queue.push(node)

    while(!bfs_queue.empty?)
      curr_node = bfs_queue.pop
      print " #{curr_node.val}"

      if(!curr_node.left.nil?)
        bfs_queue.push(curr_node.left)
      end

      if(!curr_node.right.nil?)
        bfs_queue.push(curr_node.right)
      end
    end


  end

  def delete_recursive(node, val)

    return if(node.nil?)

    if(node.val == val)
      # no children
      if(node.left.nil? && node.right.nil?)
        del_val = node.val
        node = nil
        return del_val
      end

      # one children
      if(node.left.nil?)
        del_val = node.right.val
        node.right = nil
        return del_val
      end

      #two children: we need to find a node to replace the deleted node.
      # Hence we will find the smallest child  on the deleted node's right subtree
      smallest_val = find_smallest_value(node.right)
      node.value = smallest_val
      node = delete_recursive(node.right, smallest_val)
      node
    end
  end

  def find_smallest_value(node)
    node.left.nil? ? node.val : find_smallest_value(node.left)
  end


  def contains_recursive?(node, val)
    return false if node.nil?
    return true if node.val == val

    val < node.val ? contains_recursive?(node.left, val) : contains_recursive?(node.right, val)
  end

  def insert_into(current, val)
    #base case
    return TreeNode.new(val)  if current.nil?

    case current.val <=> val # curr_val > val
    when 1
      current.left = insert_into(current.left, val)
    when -1
      current.right = insert_into(current.right, val)
    when 0
      return current
    end
    current # be mindful of returning the value, otherwise the tree would always be of height 2
  end
end


bt = nil
# %w{to be or not to be}.each do |word|
[6, 4, 8, 3, 5, 7, 9].each do |word|
  if bt.nil?
    bt = BinaryTree.new(word)
  else
    bt.insert(word)
  end
end

# assert(bt.contains?(8))
# assert(!bt.contains?(10))

bt.in_order
puts
bt.pre_order
puts
bt.post_order
puts
bt.breadth_first_search
