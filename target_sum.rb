# Given an integer and array of integers. Determine whether any 2 integers in the array sums to that integer.

class Array
  def has_pair_that_sums_to(target_sum)
    self.sort!
    
    self.each_with_index do |n, i|
      summand = target_sum - n

      found = bin_search(summand, i + 1, self.length - 1)

      # return "#{n} + #{self[found]} = #{target_sum}" if found
      return true if found
    end

    false
  end

  private

  def bin_search(target, left, right)
    return false if right < left

    mid = left + (right - left)/2

    if self[mid] > target
      bin_search(target, left, mid - 1)
    elsif self[mid] < target
      bin_search(target, mid + 1, right)
    else
      return mid
    end
  end  
end

puts [-1,0,1].has_pair_that_sums_to 0
puts [-5,0,1,3,10].has_pair_that_sums_to 5
puts [0,1,2,3].has_pair_that_sums_to 0
puts [0,1,2,3].has_pair_that_sums_to 10
