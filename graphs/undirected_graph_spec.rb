require_relative '../spec_helper'
require_relative 'undirected_graph'

class UndirectedGraphSpec
  def self.run_tests
    graph = UndirectedGraph.new(8)
    graph.add_edge(0, 5)
    graph.add_edge(0, 4)
    graph.add_edge(1, 6)
    graph.add_edge(2, 7)
    graph.add_edge(0, 2)
    graph.add_edge(5, 7)
    graph.add_edge(4, 6)
    # graph.to_s
    # puts "Maximum degree of the graph: #{graph.max_degree}"
    assert_equal(3, graph.max_degree)
  end
end

UndirectedGraphSpec.run_tests
