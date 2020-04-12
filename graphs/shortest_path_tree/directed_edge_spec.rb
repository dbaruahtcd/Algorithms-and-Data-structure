require_relative '../../spec_helper'
require_relative 'directed_edge'

class DirectedGraphSpec
  
  def self.run_tests
    de = DirectedEdge.new(4, 7, 10)
    assert_equal(4, de.x)
    assert_equal(7, de.y)
    assert_equal(10, de.weight)
  end
end

DirectedGraphSpec.run_tests
