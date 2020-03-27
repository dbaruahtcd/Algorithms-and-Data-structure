require_relative '../spec_helper'
require 'set'

class UndirectedGraph
  attr_reader :vertices

  def initialize(v)
    # Initialize with the number of vertices. The mapping from whatever the vertex
    # signifies(node, computer, person) to number is done with a symbol table.
    @vertices = v
    @adj = Array.new(v)
    # Each index would contain a bag of elements
    (0...v).each { |i| @adj[i] = Set.new }
  end

  # parallel edges and self loops are allowed
  def add_edge(v, w)
    @adj[v].add(w)
    @adj[w].add(v)
  end

  # degree of a vertex
  def degree(v)
    @adj[v].count
  end

  def max_degree
    max = 0
    0.upto(@vertices - 1) do |v|
      max = degree(v) if degree(v) > max
    end
    max
  end

  # vertices adjacent to a vertex v
  def adjacent(v)
    @adj[v]
  end

  def to_s
    puts "The graph vertices are: "
    0.upto(@vertices - 1) do |v|
      @adj[v].each do |s|
        puts "#{v} - #{s}"
      end
    end
  end
end
