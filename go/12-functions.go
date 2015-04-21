package main

import "fmt"

// last int on next line declares return type
func plus(a int, b int) int {
  return a + b
}

// like-typed consecutive parameter types can be dropped
func plusPlus(a, b, c int) int {
  return a + b + c
}

func main() {
  result := plus(1, 2)
  fmt.Println("1+2 = ", result)

  result = plusPlus(1, 2, 3)
  fmt.Println("1+2+3 = ", result)
}