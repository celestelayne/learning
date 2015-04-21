package main

import "fmt"

// accepts arbitrary number of ints
func sum(nums ...int) {
  fmt.Println(nums, " ")
  total := 0
  for _, num := range nums {
    total += num
  }
  fmt.Println(total)
}

func main() {
  sum(1, 2)
  sum(1, 2, 3)

  nums := []int{1, 2, 3, 4}
  // apply a slice as arguments to a function with ...
  sum(nums...)
}