package main

import "fmt"

//membuat struct
// untuk penamaan struct, biasa Go-lang developer menggunakan huruf besar terlebih dahulu
type Pelanggan struct {
	Nama, Alamat string
	Umur         int
}

//membuat struct method
func (pelanggan Pelanggan) sayHello() {
	fmt.Println("Hello, My Name is", pelanggan.Nama)
}

func main() {
	//membuat Data Struct
	var Idris Pelanggan
	Idris.Nama = "Idris Kristian Bukit"
	Idris.Alamat = "Jakarta Pusat"
	Idris.Umur = 25

	fmt.Println(Idris)

	//mengakses langsung data dalam struct
	fmt.Println(Idris.Nama)
	fmt.Println(Idris.Alamat)
	fmt.Println(Idris.Umur)

	// 1. Struct Literals #1 - Cara ini lebih reliable,, sekalipun struct akan mengalami perubahan urutan deklarasi data
	Kristian := Pelanggan{
		Nama:   "Kristian Idris",
		Alamat: "Ujung Sampun",
		Umur:   25,
	}

	fmt.Println(Kristian)

	// 2. Struct Literals #2 - cara ini akan mengalami masalah, ketika struct mengalami perubahan urutan deklarasi data
	Bukit := Pelanggan{"Bukit", "Berastagi", 25}
	fmt.Println(Bukit)

	//memanggil fungsi struct method
	Enos := Pelanggan{Nama: "Enos"}
	Enos.sayHello()

}
