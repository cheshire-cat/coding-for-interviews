class Node
  attr_accessor :data, :next

  def initialize(data = nil)
    @data = data
    @next = nil
  end
end

def make_cycled_list
  node1 = Node.new 1
  node2 = Node.new 2
  node3 = Node.new 3
  node4 = Node.new 4
  node5 = Node.new 5
  
  node1.next = node2
  node2.next = node3
  node3.next = node4
  node4.next = node5
  node5.next = node2

  node1
end

def make_list
  head = nil
  10.times do |i|
    node ||= Node.new i+1
    head ||= node
    node.next = Node.new i+1
    node = node.next
  end

  head
end

def traverse(node, &block)
  return unless node

  yield node if block_given?

  return node if node.next.nil?

  traverse node.next, &block
end

def detect_cycle1(node)
  visited_nodes = []

  until node.nil? do
    return true if visited_nodes.include? node
    visited_nodes << node
    node = node.next
  end

  false
end

def detect_cycle2(node)
  slow = node
  fast = node

  until fast.next.nil? || fast.next.next.nil? do
    slow = slow.next
    fast = fast.next.next
    return true if slow == fast
  end

  false
end

clist = make_cycled_list
list  = make_list

puts detect_cycle1 clist
puts detect_cycle1 list
puts "======"
puts detect_cycle2 clist
puts detect_cycle2 list
