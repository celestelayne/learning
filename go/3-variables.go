package main

import "fmt"

func main() {
  // var declares multiple variables
  // Type declared after var name
  var a string = "initial"
  fmt.Println(a)

  var b, c int = 1, 2
  fmt.Println(b, c)

  var d = true
  fmt.Println(d)

  var e int // initializes to 0
  fmt.Println(e)

  f := "shorthand"
  fmt.Println(f)
}