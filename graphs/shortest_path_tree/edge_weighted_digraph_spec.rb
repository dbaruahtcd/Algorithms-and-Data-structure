require_relative '../../spec_helper'
require_relative 'edge_weighted_digraph'
require_relative 'directed_edge'

class EdgeWeightedDigraphSpec
  def self.run_tests
    digraph = EdgeWeightedDigraph.new(6)
    [[1, 2, 10], [1, 3, 20], [4, 5, 25]].each do |arr|
      edge = DirectedEdge.new(arr[0], arr[1], arr[2])
      digraph.add_edge(edge)
    end
    
    # digraph.to_s(1)
    # count # elements in the set
    assert_equal(2, digraph.adjacent(1).count)
    assert_equal(0, digraph.adjacent(2).count)
    assert_equal(1, digraph.adjacent(4).count)
  end
end

EdgeWeightedDigraphSpec.run_tests