require "byebug"

class Array
  def my_uniq
    arr = []
    self.each {|ele| arr << ele unless arr.include?(ele)}
    arr
  end

  def two_sum 
    arr = []
    self.each_with_index do |e1, i1|
      self.each_with_index do |e2, i2|
        arr << [i1, i2] if e1 + e2 == 0 && i2 > i1
      end
    end

    arr
  end

  def my_transpose 
    new_arr = Array.new(self.length){Array.new()}
    (0...self.length).each do |row|
      (0...self.length).each do |col|
        new_arr[col] << self[row][col]
      end
    end

    new_arr
  end

  def stock_picker
    max = self[1]-self[0]
    return_arr = [0,1]
    (0...self.length-1).each do |idx1|
      (1...self.length).each do |idx2|
        diff = self[idx2] - self[idx1]
        if diff > max && idx2 > idx1
          max = diff
          return_arr = [idx1,idx2]
        end
      end
    end
    return_arr
  end
end