class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def to_s
    buf = ''
    buf << "#{@left ? "[#{@left.data}]" : []}<-[#{@data}]->#{@right ? "[#{@right.data}]" : []} \n"
  end

  alias_method :inspect, :to_s
end

class BST
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(current_node = @root, new_node)
    until @root
      @root = new_node
      return
    end

    if new_node.data < current_node.data
      if current_node.left
        insert(current_node.left, new_node)
      else
        current_node.left = new_node
        return
      end
    elsif new_node.data > current_node.data
      if current_node.right
        insert(current_node.right, new_node)
      else
        current_node.right = new_node
        return
      end
    else
      raise "Key already exists"
    end
  end

  def traverse(node = @root, &block)
    return unless node

    yield node if block_given?

    traverse(node.left,  &block)
    traverse(node.right, &block)
  end

  def height(node = @root)
    return 0 if node.nil?

    left  = height node.left
    right = height node.right

    if left > right
      return left + 1
    else
      return right + 1
    end
  end

  def count
    c = 0
    traverse do |node|
      c += 1
    end

    c
  end

  def to_s
    tree = ''
    traverse do |node|
      tree << "#{node}"
    end

    tree
  end

  alias_method :inspect, :to_s
end

t = BST.new

t.insert Node.new 100
t.insert Node.new 110
t.insert Node.new 90
t.insert Node.new 95
t.insert Node.new 80
t.insert Node.new 120
t.insert Node.new 115
t.insert Node.new 130
t.insert Node.new 135
t.insert Node.new 94
t.insert Node.new 93
t.insert Node.new 91
t.insert Node.new 79
t.insert Node.new 81

puts t
puts "Tree height - #{t.height}"
puts "Count of nodes - #{t.count}"
