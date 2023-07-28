/*
	Package Initialization
	1. saat kita membuat package, kita bisa membuat sebuah function yang akan diakses ketika package kita diakses
	2. ini sangat cocok ketika contohnya, jika package kita berisi function-function untuk berkomunikasi dengan database, kita membuat function inisialisasi untuk membuka koneksi ke database
	3. untuk membuat function yang diakses secara otomatis ketika package diakses, kita cukup membuat function dengan nama init
*/

/*
	Blank Identifier
	1. kadang kita hanya ingin menjalankan init function di package tanpa harus mengeksekusi salah satu function yang ada di package
	2. secara default, Go-Lang akan komplain ketika ada package yang di import namun tidak digunakan
	3. untuk menangangi hal tersebut, kita bisa menggunakan blank identifier (_) sebelum nama package ketika melakukan import
*/