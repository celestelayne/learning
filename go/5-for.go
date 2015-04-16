package main

import "fmt"

func main() {
  // only loops in Go
  i := 1 // auto-casts to int
  for i <= 3 {
    fmt.Println("incrementing:", i)
    i = i + 1
  }

  for j := 0; j < 9; j++ {
    fmt.Println("funk: ", j)
  }

  for {
    fmt.Println("loops till break or return")
    break
  }
}