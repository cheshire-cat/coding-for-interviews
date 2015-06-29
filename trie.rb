class Node
  attr_accessor :data, :children, :is_word

  alias_method :word?, :is_word

  def initialize(data)
    @data     = data
    @children = {}
    @is_word  = false
  end

  def to_s
    "#{@data}"
  end

  alias_method :inspect, :to_s
end

class Trie
  attr_accessor :root
  
  def initialize
    @root = Node.new nil
  end

  def add_word(node = @root, word)
    return if word.empty?

    char = word.slice! 0

    if node.children.has_key? char
      new_node = node.children[char]
    else
      new_node = Node.new(char)
      new_node.is_word = word.empty?
      node.children[char] = new_node
    end

    add_word(new_node, word)
  end

  def autocomplete(node = @root, word_part)
    word_base = word_part.dup

    words = []
    
    until word_part.empty? do
      char = word_part.slice!(0)
      if node.children.has_key? char
        node = node.children[char]
        words << word_base if (node.is_word && word_part.empty?)
      else
        return false
      end
    end
    
    node.children.each_value do |c_n|
      word = word_base
      traverse c_n do |n|
        word += "#{n}"
        words << word if n.is_word
        word = word_base + "#{c_n}" if n.is_word 
      end
    end

    words
  end

  def traverse(node = @root, &block)
    return unless node

    yield node if block_given?

    node.children.each_value do |node|
      traverse(node, &block)
    end
  end
end

t = Trie.new

t.add_word 'cat'
t.add_word 'dog'
t.add_word 'catterpillar'
t.add_word 'cut'
t.add_word 'car'

puts "c -> #{t.autocomplete 'c'}"
puts "ca -> #{t.autocomplete 'ca'}"
puts "cat -> #{t.autocomplete 'cat'}"
puts "catterp -> #{t.autocomplete 'catterp'}"
puts "car -> #{t.autocomplete 'car'}"
puts "cattt -> #{t.autocomplete 'cattt'}"
puts "gas -> #{t.autocomplete 'gas'}"
