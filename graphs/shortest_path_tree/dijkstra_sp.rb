#Initialize distTo[s] = 0 and distTo[v] = ∞ for all other vertices.
# Repeat until optimality conditions are satisfied:
# - Relax any edge.

class DijkstraSP

  def initialize(edge_weighted_digraph, s)
    @graph = edge_weighted_digraph
    @src = s
    vertices = @graph.v
    @dist_to = Array.new(vertices)
    @edge_to = Array.new(vertices)
    #priority queue for the vertices
    @pq = Array.new(vertices)
    
    # set dist_to as infinity for all vertices except the source
    (0...vertices).each {|i| @dist_to[i] = Float::INFINITY }
    @dist_to[s] = 0.0
    
    @pq[s] = 0.0
    while(!@pq.empty?)
      v = @pq.delete(@pq.min)
      @graph.adjacent(v).each do |edge|
        relax(edge)
      end
    end
    
  end
  
  def relax(edge)
    v = edge.x
    w = edge.y
    if (@dist_to[w] > @dist_to[v] + edge.weight)
      @dist_to[w] = @dist_to[v] + edge.weight
      @edge_to[w] = edge
      if @pq.include?(w) 
        @pq[w] = @dist_to[w]
      else
        @pq[w] = @dist_to[w]
      end
    end
  end
end