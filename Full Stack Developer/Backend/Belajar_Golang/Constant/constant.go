package main

import (
	"fmt"
)

func main() {
	const firstName = "Idris"
	const middleName = "Kristian"
	const lastName = "Bukit"

	fmt.Println(firstName)
	fmt.Println(middleName)
	fmt.Println(lastName)

	const (
		firstName1  = "Idris-1"
		middleName2 = "Kristian-2"
		lastName3   = "Bukit-3"
	)

	fmt.Println(firstName1)
	fmt.Println(middleName2)
	fmt.Println(lastName3)
}
