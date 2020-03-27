require_relative 'undirected_graph'
require_relative '../spec_helper'

# Usually useful for find out if a path exists between two vertices
# Put unvisited vertices on a stack(through recursion call)
class DepthFirstPaths

  def initialize(graph, source)
    @graph = graph
    @source = source
    @marked = Array.new(graph.vertices, false)
    @edge_to = Array.new(graph.vertices)
    dfs(graph, source)
  end

  def has_path_to?(vertex)
    @marked[vertex]
  end

  # check if there is path from the source to a given vertex.
  # we will use a edge_to array to find paths to the source
  def path_to(vertex)
    return nil if(!@marked[vertex]) # a path doesn't exists
    curr_vertex = vertex
    path = []
    while(curr_vertex != @source)
      path.push(curr_vertex)
      curr_vertex = @edge_to[curr_vertex]
    end
    path.push(@source)
    path
  end

  private
  def dfs(graph, vertex)
    @marked[vertex] = true
    @graph.adjacent(vertex).each do |w|
      if(!@marked[w])
        dfs(graph, w)
        @edge_to[w] = vertex
      end
    end
  end
end

graph = UndirectedGraph.new(10)
graph.add_edge(0, 5)
graph.add_edge(5, 7)
graph.add_edge(7, 9)
graph.add_edge(4, 6)


dfs = DepthFirstPaths.new(graph, 0)
assert_equal([9, 7, 5, 0], dfs.path_to(9))
assert(!dfs.has_path_to?(6))
assert(dfs.has_path_to?(9))
