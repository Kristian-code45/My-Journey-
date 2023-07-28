package main

import "fmt"

func main() {
	orang := map[string]string{
		"nama":   "Idris",
		"alamat": "Jakarta",
	}
	// menambahkan data
	orang["pekerjaan"] = "Guru"

	fmt.Println(orang)
	fmt.Println(orang["nama"])
	fmt.Println(orang["alamat"])

	var buku map[string]string = make(map[string]string)
	buku["judul"] = "Belajar Go-Lang"
	buku["pengajar"] = "Eko Kurniawan"
	buku["salah"] = "ups"

	fmt.Println(buku)
	fmt.Println(len(buku))

	delete(buku, "salah")

	fmt.Println(buku)
	fmt.Println(len(buku))
}
