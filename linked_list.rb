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

  def insert(data)
    tail = @head
    @head = Node.new(data)
    @head.next = tail
  end

  def delete_all(data)
    deleted_data = false
    prev_node = @head

    return false if @head.nil?

    while @head.data == data
      deleted_data = @head.data
      @head = @head.next
    end

    traverse do |node|
      if node.data == data
        deleted_data = node.data
        prev_node.next = node.next
      else
        prev_node = node
      end
    end

    deleted_data
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

ll = LinkedList.new

ll.insert 1
ll.pop
ll.push 1
ll.push 2
ll.insert 0
ll.push 0
ll.insert 2
ll.push 2
ll.delete_all 0
ll.delete_all 2
p ll