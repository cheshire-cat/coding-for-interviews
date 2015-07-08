class Array
  def merge_sort
    return self if self.length <= 1

    middle = (self.length / 2).to_i
    left   = self[0...middle].merge_sort
    right  = self[middle...self.length].merge_sort

    return merge(left, right)
  end

  private

  def merge(left, right)
    result = Array.new

    while left.length > 0 || right.length > 0
      if left.length > 0 && right.length > 0
        if left[0] <= right[0]
          result << left.shift
        else
          result << right.shift
        end
      elsif left.length > 0
        left.length.times { result << left.shift }
      elsif right.length > 0
        right.length.times { result << right.shift }
      end
    end

    return result
  end
end

a = [5,1,3,2,4]

p a
p a.merge_sort
