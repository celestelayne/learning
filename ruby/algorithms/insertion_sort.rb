# Algorithms 1. Insertion sort

# Strategy: keep loop invariant array[j - 1] sorted, where j is (1..array.length - 1)
# run time depends on 1) size of input array and 2) how much the input array is already sorted.
def insertion_sort(array)
  1.upto(array.length - 1) do |j|
    i = j - 1
    key = array[j]
    while (i >= 0) && (array[i] > key) do
      array[i + 1] = array[i]
      i -= 1
    end

    array[i + 1] = key
  end

  array
end

puts insertion_sort([2, 1, 4, 3, 5])
