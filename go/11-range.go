package main

import "fmt"

func main() {

  // range used to sum a slice of numbers
  // provides index and element over array / slice
  numbers := []int{2, 3, 4}
  sum := 0
  for _, num := range numbers {
    sum += num
  }
  fmt.Println("sum", sum)

  // range gives key / value over map
  m := map[string]string{"a": "apple", "b": "bannana"}
  for key, value := range m {
    fmt.Printf("%s -> %s\n", key, value)
  }

  // returns unicode code pointers..
  for i, c := range "go" {
    fmt.Println(i, c)
  }
}