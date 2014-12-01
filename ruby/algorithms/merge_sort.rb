def merge_sort(array)
  # Handle base case
  return array if array.length <= 1

  # Divide
  left = merge_sort array[0, array.length / 2]
  right = merge_sort array[array.length / 2, array.length]

  # Conquer
  result = []
  while left.length > 0 && right.length > 0
    smallest_el = left[0] <= right[0] ? left.shift : right.shift
    result << smallest_el
  end

  result = result.concat(left).concat(right)
  result
end
