package main

import "fmt"

//membuat fungsi Salam
func salam() {
	fmt.Println("Syallom")
}

//membuat fungsi menyapa dengan parameter
func menyapa(namaDepan string, namaBelakang string) {
	fmt.Println("Syallom", namaDepan, namaBelakang)
}

//membuat fungsi panggilan dengan parameter dan return value
func menyambut(panggilan string) string {
	//menggunakan if untuk mendapatkan hasil return yang berbeda-beda
	if panggilan == "" {
		return "Selamat Datang Bro"
	} else {
		return "Selamat Datang " + panggilan
	}
	// return value harus bertipe data sama
}

//membuat fungsi namaSiapa dengan returning multiple value
func namaSiapa() (string, string) {
	return "Idris", "Kristian"
}

//Membuat fungsi namaLengkap dengan Named Return Values
func namaLengkap() (namaPertama, namaKedua, NamaKetiga string) { /*<-- bila named variable bertipe sama,
	maka dapat dituliskan sekali saja di akhir,
	tetapi bila berbeda, maka dituliskan dibelakang variable:
	contoh. nama string, umur int*/
	namaPertama = "Ceria"
	namaKedua = "Arbina"
	NamaKetiga = "br Bukit"

	return namaPertama, namaKedua, NamaKetiga //menuliskan nama variable pada return itu tidak wajib. itu bersifat opsional
}

//membuat fungsi penjumlahan dengan Variadic Function
func penjumlahan(angkanya ...int) int { //data yang berada dalam angkanya merupakan slice data
	// bagaimana bila sama butuh dua atau lebih variable arguments? TIDAK BISA. hanya BISA SATU
	// dan itu hanya parameter yang paling terakhir, atau yang paling kanan
	/*
		bila bentuk func adalah berikut:
		penjumlahan(angkanya[]int) <-- bila demikian, maka perlu:
		1. membuat slice, sebelum memanggil func penjumlahan.

		namun bila tidak ingin menggunakan slice, maka dapat menggunakan:
		penjummlahan(angkanya...int) <-- variadic function

		bagaimana dua variable?
		func penjumlahan(angkanya...int, angkanya1 int) <-- ini salah!!
		func penjumlahan(angkanya1 int, angkanya...int) <-- ini benar

	*/
	total := 0
	for _, angka := range angkanya {
		total += angka
	}
	return total
}

//membuat fungsi perpisahan dengan function Value
func perpisahan(kamuSiapa string) string {
	return "Sampai Ketemu Lagi " + kamuSiapa
}

//membuat fungsi wordFilter dengan Function as Parameter
func greetingsWordFilter(word string, filter func(string /*<-- parameter bertipe string*/) string /*<-- return value bertipe string*/) {
	fmt.Println("Shallom", filter(word))
}

//membuat function Type Declarations untuk Function as Parameter
type Filter func(string) string

func sapaansWordFilter(kataKu string, filter Filter) {
	fmt.Println("Shallom Bro", filter(kataKu))
}

func wordFilter(word string) string {
	if word == "Bangsat" {
		return "...."
	} else {
		return word
	}
}

//membuat fungsi ditandai dengan program anonymous function
type Ditandai func(string) bool

func daftarPeserta(sebutan string, ditandai Ditandai) {
	if ditandai(sebutan) {
		fmt.Println("Maaf", sebutan, "Kamu diblok!")
	} else {
		fmt.Println("Selamat Datang", sebutan, "di dalam Komunitas")
	}
}

//membuat fungsi factorialLoop untuk Recursive Function
func factorialLoop(value int) int {
	result := 1
	for i := value; i > 0; i-- {
		result *= i
	}
	return result
}

//membuat fungsi factorial dengan recursive function
func factorialR(value int) int {
	if value == 1 {
		return 1
	} else {
		return value * factorialR(value-1)
	}
}

/*_____________________________________________________________________________________________________________________________________________________________________________________*/
/*_____________________________________________________________________________________________________________________________________________________________________________________*/
/*_____________________________________________________________________________________________________________________________________________________________________________________*/
func main() {
	//memanggil fungsi Salam
	salam()

	//mengulang fungsi salam menggunakan for
	for i := 0; i < 2; i++ {
		salam()
	}

	//memanggil fungsi menyapa dengan parameter
	menyapa("Idris", "Kristian")

	//mengulang fungsi menyapa dengan parameter menggunakan for
	for i := 0; i < 2; i++ {
		menyapa("Edo", "Sejahtera")
	}

	//memanggil fungsi menyabut dengan parameter dan return value
	hasil := menyambut("Bukit")
	fmt.Println(hasil)

	//mengulang fungsi menyambut dengan parameter dan return value menggunakan for
	for i := 0; i < 2; i++ {
		hasil = menyambut("Bukit")
		fmt.Println(hasil)
	}

	//memanggil fungsi namaSiapa dengan returning multiple values
	namaAwal, namaAkhir := namaSiapa()
	fmt.Println(namaAwal, namaAkhir)

	//mengulang fungsi namaSiapa dengan returning multiple value menggunakan for
	for i := 0; i < 2; i++ {
		namaAwal, namaAkhir := namaSiapa()
		fmt.Println(namaAwal, namaAkhir)
	}

	//memanggil fungsi namaSiapa dengan returning multiple values
	namaAwalku, _ /*namaAkhirku*/ := namaSiapa()
	fmt.Println(namaAwalku /*mengabaikan retun value namaAkhirku*/)

	//memanggil fungsi namaLengkap dengan named return values
	namaPertama, namaKedua, namaKetiga := namaLengkap()
	fmt.Println(namaPertama, namaKedua, namaKetiga)

	//memanggil fungsi penjumlahan dengan Variadic Function
	total := penjumlahan(10, 10, 10, 11, 34, 14, 11, 16)
	fmt.Println(total)

	//Slice Parameter dalam Variadic Function
	angkaSlice := []int{10, 10, 10, 11, 34}
	total = penjumlahan(angkaSlice...)
	fmt.Println(total)

	//memanggil fungsi perpisahan dengan function value
	// pisah := perpisahan // <-- perpisahan sekarang adalah value dari variable pisah
	//fmt.Println(pisah("Yudha"))
	pisah := perpisahan("Yudah")
	fmt.Println(pisah)

	//memanggul fungsi greetingWordFilter dengan Function as Parameter
	greetingsWordFilter("Jahtra", wordFilter)

	filter := wordFilter
	greetingsWordFilter("Bangsat", filter)

	//memanggil fungsi sapaanWordFilter dengan Function Type Declarations untuk Function as Parameter
	sapaansWordFilter("Ceria", wordFilter)

	filter = wordFilter
	sapaansWordFilter("Bangsat", wordFilter)

	//memanggil fungsi daftarPeserta dengan anonymous Function
	ditandai := func(sebutan string) bool { //dibuat variable terlebih dahulu
		return sebutan == "Bacot"
	}

	daftarPeserta("Bambang", ditandai)
	daftarPeserta("Bacot", func(sebutan string) bool { //langsung di dalam parameter
		return sebutan == "Bacot"
	})

	//memanggil fungsi factorialLoop untuk Recursive Function
	loop := factorialLoop(5)
	fmt.Println(loop)

	//memanggil fungsi factorialR
	recursive := factorialR(5)
	fmt.Println(recursive)

}
