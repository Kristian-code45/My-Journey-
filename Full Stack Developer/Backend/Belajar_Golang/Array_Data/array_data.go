package main

import "fmt"

func main() {

	var nama [3]string

	nama[0] = "Idris"
	nama[1] = "Kristian"
	nama[2] = "Bukit"

	fmt.Println(nama[0])
	fmt.Println(nama[1])
	fmt.Println(nama[2])
	// fmt.Println(nama[3]) - lebih dari index(error)

	var nilai = [3]int{
		90, 80, 70, //60, - lebih dari index(error)
	}
	fmt.Println(nilai)

	fmt.Println(len(nama))
	fmt.Println(nilai[0])
	fmt.Println(nilai[1])
	fmt.Println(nilai[2])

}
