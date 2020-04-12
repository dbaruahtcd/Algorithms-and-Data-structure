require 'set'

class EdgeWeightedDigraph
  attr_reader :v
  def initialize(vertices)
    @v = vertices
    @adj_list = Array.new(@v)
    (0..@v).each { |i| @adj_list[i] = Set.new }
  end
  
  def add_edge(directed_edge)
    x = directed_edge.x
    @adj_list[x].add(directed_edge)
  end
  
  def adjacent(vertex)
    @adj_list[vertex]
  end
  
  def to_s(vertex)
    edges = adjacent(vertex)
    edges.each do |e|
      e.to_s
    end
  end
end