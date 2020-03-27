require_relative "undirected_graph"
require_relative "../spec_helper"

# Find path with the shortest number of hops(edges)
# Put unvisited vertices in a Queue
class BreadthFirstPaths
  def BreadthFirstPaths(graph, source)
    @marked = Array.new(graph.vertices)
    @edge_to = Array.new(graph.vertices)
    bfs(graph, source)
  end

  # Put items into the queue and mark it as visited
  private
  def bfs(graph, vertex)
    queue = Queue.new
    queue.enq(vertex)
    @marked[curr_vertex] = true

    while(!queue.empty?)
      curr_vertex = queue.deq
      for w in graph.adjacent(curr_vertex) do
        if(!@marked[w])
          queue.enq(w)
          @marked[w] = true
          @edge_to[w] = vertex
        end
      end
    end
  end
end
