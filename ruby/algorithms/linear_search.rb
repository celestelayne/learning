# Introduction to Algorithms 2.1-3

# Returns the index of v in array, or nil if v isn't in array.
def linear_search(array, v)
  index = nil

  array.each_with_index do |element, i|
    if element == v
      index == i
      break
    end
  end

  index
end
