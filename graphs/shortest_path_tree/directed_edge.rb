class DirectedEdge
  attr_reader :x, :y, :weight

  def initialize(x, y, weight)
    @x = x
    @y = y
    @weight = weight
  end
  
  alias :from, @x
  alias :to, @y
  
  def to_s
    puts " #{@x} => #{@y} w: #{@weight}"
  end
end

de = DirectedEdge.new(4, 7, 10)
assert_equal(4, de.x)
assert_equal(7, de.y)
assert_equal(10, de.weight)
