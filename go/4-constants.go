package main

import "fmt"
import "math"

// const can be used anywhere var can
const s string = "constant"

func main() {
  fmt.Println(s)

  // doesn't have type until cast, below
  const n = 5000000
  const d = 3e20 / n

  fmt.Println(d) // no type

  fmt.Println(int64(d)) // int64 type

  fmt.Println(math.Sin(n)) // float64 type
}