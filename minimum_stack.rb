class Node
  attr_accessor :data, :next
  def initialize(data = nil)
    @data = data
    @next = nil
  end

  def to_s
    @data.to_s
  end

  alias_method :inspect, :to_s
end

class LinkedList
  def initialize
    @head = nil
  end

  def pop
    current_node = @head

    if current_node.next.nil?
      data = @head.data
      @head = nil
    else
      traverse current_node.next do |node|
        current_node = node if node.next
      end
      data = current_node.next.data
      current_node.next = nil
    end

    data
  end

  def push(data)
    last_node = traverse
    if @head
      last_node.next = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def last
    last_node = traverse

    last_node.data if last_node
  end

  def empty?
    @head.nil? ? true : false
  end

  def to_s
    buf = []
    traverse do |node|
      buf << node.data
    end

    buf.to_s
  end

  alias_method :inspect, :to_s

  private

  def traverse(node = @head, &block)
    return unless node

    yield node if block_given?

    return node if node.next.nil?

    traverse(node.next, &block)
  end
end

class Stack < LinkedList; end

class MinStack < Stack
  def initialize
    super
    @min_s = Stack.new
  end

  def pop
    @min_s.pop if @min_s.last == self.last

    super
  end

  def push(data)
    if @min_s.empty?
      @min_s.push data
    elsif @min_s.last > data
      @min_s.push data
    end

    super(data)
  end

  def min
    @min_s.last
  end
end

min_stack = MinStack.new

min_stack.push 9
min_stack.push 19
min_stack.push 20
p " #{min_stack} - min -> #{min_stack.min}"

min_stack.push 3
min_stack.push 5
p " #{min_stack} - min -> #{min_stack.min}"

min_stack.pop
min_stack.pop
p " #{min_stack} - min -> #{min_stack.min}"

min_stack.pop
min_stack.pop
min_stack.pop
p " #{min_stack} - min -> #{min_stack.min}"
