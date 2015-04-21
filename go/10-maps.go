package main

import "fmt"

func main() {
  // make(map[key-type]value-type)
  m := make(map[string]int)

  m["k1"] = 7
  m["k2"] = 13

  fmt.Println("map: ", m)

  value1 := m["k1"]
  fmt.Println("value1:", value1)

  fmt.Println("len:", len(m))

  delete(m, "k2")
  fmt.Println("map after delete:", m)

  _, presence := m["k2"] // 
  fmt.Println("optional second value returned from map get:", presence)

  n := map[string]int{"foo": 1, "bar": 2}
  fmt.Println("one-line delcare + initialize:", n)
}