class Node
  attr_accessor :data, :next

  def initialize(data = nil)
    @data = data
    @next = nil
  end
end

class List
  attr_accessor :head

  def initialize(head = nil)
    @head = head
  end

  def add(node)
    last = traverse
    if @head
      last.next = node
    else
      @head = node
    end
  end

  def print
    buf = ''
    traverse do |node|
      buf += "[#{node.data}]->"
    end

    puts buf
  end

  def reverse!
    prev_node = nil
    node = @head

    until node.nil? do
      next_node = node.next
      node.next = prev_node
      prev_node = node
      node = next_node
    end

    @head = prev_node
  end

  private

  def traverse(node = @head, &block)
    return unless node

    yield node if block_given?

    return node if node.next.nil?

    traverse node.next, &block
  end
end

list = List.new
10.times do |i|
  list.add Node.new(i+1)
end
list.print

list.reverse!
list.print
