class Vertex
  attr_reader :name

  def initialize(name)
    @name = name
    @successors = []
  end
  
  def add_edge(successor)
    @successors << successor
  end

  def to_s
    "#{name} -> [#{@successors.map(&:name).join(',')}]"
  end

  alias_method :inspect, :to_s
end

class Graph
  def initialize
    @vertices = {}
  end
  
  def add_vertex(vertex)
    @vertices[vertex.name] = vertex
  end

  def add_edge(predcessor_name, successor_name)
    @vertices[predcessor_name].add_edge(@vertices[successor_name])
  end

  def [](name)
    @vertices[name]
  end

  def to_s
    buf = ''
    @vertices.each_value { |v| buf << "#{v}\n" }

    buf
  end

  alias_method :inspect, :to_s
end

g = Graph.new
g.add_vertex(Vertex.new(1))
g.add_vertex(Vertex.new(2))
g.add_vertex(Vertex.new(3))
g.add_edge(1,3)
g.add_edge(3,2)
g.add_edge(3,1)
p g
