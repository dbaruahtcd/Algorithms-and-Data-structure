require_relative 'tree_node'

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
%w{to be or not to be}.each do |word|
  if bt.nil?
    bt = BinaryTree.new(word)
  else
    bt.insert(word)
  end
end
