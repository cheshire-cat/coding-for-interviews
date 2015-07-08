class Array
  def quick_sort
    return self if self.length <= 1

    pivot_index = (self.length / 2).to_i
    pivot_value = self[pivot_index]

    left  = []
    right = []
    pivot = []

    self.each do |e|
      if e < pivot_value
        left << e
      elsif e > pivot_value
        right << e
      else
        pivot << e
      end
    end

    return left.quick_sort + pivot + right.quick_sort
  end
end

a = [5,1,3,4,2]

p a
p a.quick_sort
