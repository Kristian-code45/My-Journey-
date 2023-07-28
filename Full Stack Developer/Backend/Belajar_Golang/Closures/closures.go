package main

import "fmt"

func main() {

	counter := 0 // nilai counter seharusnya tidak berubah
	increment := func() {
		fmt.Println("Increment")
		counter++
	}

	increment()
	increment()

	fmt.Println(counter)
}
