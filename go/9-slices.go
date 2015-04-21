package main

import "fmt"

func main() {
  // make(), built in function
  // slices only typed by type of elements contained
  s := make([]string, 3) 
  fmt.Println("empty string: ", s)

  s[0] = "a"
  s[1] = "b"
  s[2] = "c"
  fmt.Println("setting individual elements in a list: ", s)
  fmt.Println("get individual element:", s[2])

  fmt.Println("len: ", len(s))

  // append() builtin func return slice with new values
  s = append(s, "d")
  s = append(s, "e", "f")
  fmt.Println("append:", s)

  // copy slice s to c
  c := make([]string, len(s))
  copy(c, s)
  fmt.Println("copy:", c)

  l := s[2:5] // slice[low:high] => s[2], s[3], s[4], includes low, excludes high
  fmt.Println("slice1:", l)

  l = s[:5]
  fmt.Println("s[:5], up to 5:", l)

  l = s[2:]
  fmt.Println("s[2:], up from 2:", l)

  t := []string{"g", "h", "i"}
  fmt.Println("declared and initialized slice:", t)

  // multi-dimensional data structres
  twoD := make([][]int, 3)
  for i := 0; i < 3; i++ {
    innerLen := i + 1
    twoD[i] = make([]int, innerLen)
    for j := 0; j < innerLen; j++ {
      twoD[i][j] = i + j
    }
  }
  fmt.Println("2d: ", twoD)
}