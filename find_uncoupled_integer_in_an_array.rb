class Array
  # can find more than 1 unpaired
  def find_uncoupled1
    set = {}
    self.each do |e|
      if set.has_key? e
        set.delete e
      else
        set[e] = true
      end
    end

    puts set.keys.inspect
  end

  # can find only 1 unpaired
  def find_uncoupled2
    all = 0
    self.each { |e| all ^= e }

    puts all.inspect
  end
end

array = [1,2,3,4,5,1,2,3,4]

array.find_uncoupled1
array.find_uncoupled2
