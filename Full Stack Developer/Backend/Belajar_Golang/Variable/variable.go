package main

import "fmt"

func main() {
	var name string

	name = "Idris Kristian"
	fmt.Println(name)
	// ubah isi variable name
	name = "Idris Kristian Bukit"
	fmt.Println(name)
	////////////////////////
	var agel = 38
	fmt.Println(agel)

	negara := "Indonesia"
	fmt.Println(negara)

	negara = "Belanda"
	fmt.Println(negara)

	var (
		firstName  = "Idris"
		secondName = "Kristian"
	)
	fmt.Println(firstName)
	fmt.Println(secondName)
}
