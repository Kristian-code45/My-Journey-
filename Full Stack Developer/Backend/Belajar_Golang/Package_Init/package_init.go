package main

import (
	"Belajar_Golang/database" // menambahakan _ (garis bawah), ketika import file tidak digunakan
	"fmt"
)

func main() {
	result := database.GetDatabase()
	fmt.Println(result)
}
