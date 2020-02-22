class TreeNode
  attr_reader :val
  attr_accessor :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end
