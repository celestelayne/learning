package main

import "fmt"

// return function closes over variable i
// to form a closures
// returns a function that returns an int
func intSequence() func() int {
  i := 0
  return func() int {
    i += 1
    return i
  }
}


func main() {
  nextInt := intSequence()

  fmt.Println(nextInt())
  fmt.Println(nextInt())
  fmt.Println(nextInt())

  newInts := intSequence()
  fmt.Println(newInts())
  fmt.Println(newInts())
  fmt.Println(newInts())
}