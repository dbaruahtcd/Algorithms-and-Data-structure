require_relative 'undirected_graph'
require_relative '../spec_helper'
# Initialize all vertices v as unmarked.
# For each unmarked vertex v, run DFS to identify all
# vertices discovered as part of the same component.
# Preprocess graph to answer queries of the form is v connected to w?
# in constant time.

class ConnectedComponents
  attr_reader :count, :id # total number of components
  def initialize(graph)
    @graph = graph
    @count = 0
    @id = Array.new(graph.vertices) # the component a vertex belongs to
    @marked = Array.new(graph.vertices, false)

    for i in (0...graph.vertices) do
      if(!@marked[i])
        dfs(@graph, i)
        @count += 1
      end
    end
  end

  def connected?(v, w)
    @id[v] == @id[w]
  end

  private
  def dfs(graph, vertex)
    # debugger
    @marked[vertex] = true
    @id[vertex] = @count
    for v in graph.adjacent(vertex) do
      dfs(graph, v) if(!@marked[v])
    end
  end
end

# Gotcha the vertices must be in consecutive order
graph = UndirectedGraph.new(6)
graph.add_edge(0, 1)
graph.add_edge(1, 2)
graph.add_edge(2, 3)
graph.add_edge(4, 5)

cc = ConnectedComponents.new(graph)
assert_equal(2, cc.count)
assert(cc.connected?(2, 3))
assert(!cc.connected?(2, 5))
