package main

import "fmt"

func main() {
	nama := "Kristian"

	if nama == "Idris" /* ini harus diisi dengan condition bertipe data boolean*/ {
		fmt.Println("Hello World")
	}

	if nama == "Idris" {
		fmt.Println("Hello World")
	} else {
		fmt.Println("Hai, Kenalan Donk!")
	}

	if nama == "Idris" {
		fmt.Println("Hello Idris")
	} else if nama == "Kristian" {
		fmt.Println("Hello Kristian")
	} else {
		fmt.Println("Hai, Kenalan Donk!")
	}

	if length := len(nama); length > 5 /*sama dengan--- var length = len(nama) if length > 5 ---*/ {
		fmt.Println("Nama terlalu panjang")
	} else {
		fmt.Println("Nama Sudah Benar")
	}
}
