# We need to implrment a queue, not a stack, right?
class Stack < Array; end

class QueueWith2Stacks
  def initialize(stack1 = Stack.new, stack2 = Stack.new)
    @stack1 = stack1
    @stack2 = stack2
  end

  def enq(item)
    @stack1.push item
  end

  def deq
    until @stack1.empty? do
      @stack2.push @stack1.pop
    end

    item = @stack2.pop

    until @stack2.empty? do
      @stack1.push @stack2.pop
    end
    
    item
  end

  def print
    buf = ''
    @stack1.each do |item|
      buf += "[#{item}]"
    end

    puts buf
  end
end

q = QueueWith2Stacks.new

5.times do |i|
  q.enq i+1
end
q.print

3.times do
  q.deq
end
q.print

q.enq 6
q.deq
q.print
