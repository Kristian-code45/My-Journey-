package Package

//contoh variable access modifier
var version = "1.0.0"      //tidak bisa di akses dari luar
var Application = "Golang" // dapat diakses dari luar

//contoh function access modifier
func akseslah(siapa string) string {
	//tidak bisa di akses dari luar
	return "Boleh " + siapa
}

func Akseslah(Siapa string) string {
	//dapat diakses dari luar
	return "Bisa Kok " + Siapa
}

func main() {
	/*
		Access Modifier
		1. di bahasa pemrograman lain, biasanya ada kata kunci yang bisa digunakan untuk menentukan access modifier terhadap suatu function atau variable
		2. di Go-Lang, untuk menentukan access modifier, cukup dengan nama function atau variable
		3. jika nama nya diawali dengan huruf besar, maka artinya bisa diakses dari package lain, jika dimulai dengan huruf kecil, artinya tidak bisa diakses dari package lain

	*/

}
