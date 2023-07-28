package main

import "fmt"

func main() {
	nama := "Idris"

	switch nama {
	case "Idris":
		fmt.Println("Hello Idris")
	case "Kristian":
		fmt.Println("Hello Kristian")
	default:
		fmt.Println("Hi Boleh Kenalan?")
	}

	switch length := len(nama); length > 5 {
	case true:
		fmt.Println("Nama Terlalu Panjang")
	case false:
		fmt.Println("Nama Sudah Benar")
	}

	length := len(nama)
	switch {
	case length > 10:
		fmt.Println("Nama Terlalu Panjang")
	case length > 5:
		fmt.Println("Nama Lumayan Panjang")
	default:
		fmt.Println("Nama Sudah Benar")
	}

}
