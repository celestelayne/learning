package main

import "fmt"

// returns two integers
func vals() (int, int) {
  return 3, 7
}

func main() {
  a, b :=  vals()
  fmt.Println("a:", a)
  fmt.Println("b:", b)

  // _ is the blank identifier (for unwanted variables)
  _, c := vals()
  fmt.Println(c)
}