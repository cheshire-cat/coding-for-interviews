class Deleted; end

class OAHash
  def initialize(size)
    @size = size
    @container = Array.new
  end

  def hash_f(item)
    return item.hash % @size
  end

  def insert(item)
    key = hash_f item

    if @container[key].nil? || @container[key] == item || @container[key].class == 'Deleted'
      @container[key] = item
    else
      (key..@container.length + 1).map do |index|
        if @container[index].nil? || @container[index] == item || @container[index].class == 'Deleted'
          @container[index] = item
          break
        else
          next
        end
      end
    end
  end

  def delete(item)
    key = search item

    key ? @container[key] = Deleted.new : false
  end

  def search(item)
    key = hash_f item
    if @container[key] == item
      return key
    else
      (key..@container.length).map do |index|
        if @container[index] == item
          return index
        elsif @container[index].nil?
          return false
        end
      end
    end
  end
end

h = OAHash.new 5

h.insert "test"
h.insert "test"
h.insert "cat"
h.insert "dog"

p h
h.delete 'dog'
p h
p "cat -> #{h.search 'cat'}"