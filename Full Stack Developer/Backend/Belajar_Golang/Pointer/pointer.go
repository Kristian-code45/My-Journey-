package main

import "fmt"

// membuat program dengan parameter untuk pointer
type Address struct {
	City, Province, Country string
}

// membuat program pointer di method tanpa pointer
type Laki struct {
	Nama string
}

// membuat fungsi dengan parameter untuk pointer
func ChangeCountryToIndonesia(ingan *Address) {
	//untuk mengubah fungsi memiliki parameter yang merupakan pointer, cukup tambahkan * (STAR) menjadi *Address
	ingan.Country = "Indonesia"
}

// membuat program pointer di method, cukup tambahkan operator * (STAR)
func (laki *Laki) Menikah() {
	laki.Nama = "Mr. " + laki.Nama
}

func main() {

	//membuat program pass by value
	address1 := Address{"Kabanjahe", "Tanah Karo", "Sumatera Utara"}
	address2 := address1 // proses yang terjadi di sini adalah pass by value

	address2.City = "Sibolangit"

	fmt.Println(address1) // address1 tidak berubah
	fmt.Println(address2)

	//membuat pointer dengan Operator & (AND)
	alamat1 := Address{"Kabanjahe", "Tanah Karo", "Sumatera Utara"}
	alamat2 := &alamat1 //alamat2 menjadi pointer alamat1, sehingga menjadi pass by reference

	//sama dengan (Secara Manual):
	//var alamat1 Address = Address{"Kabanjahe", "Tanah Karo", "Sumatera Utara"}
	//var alamat2 *Address = &alamat1

	alamat2.City = "Tiga Binanga"

	fmt.Println(alamat1)
	fmt.Println(alamat2)

	//membuat program Operator * (STAR)
	lokasi1 := Address{"Surabaya", "Jawa Timur", "Indonesia"} // Data #1 (memory)
	lokasi2 := &lokasi1
	lokasi3 := &lokasi1

	lokasi2.City = "Malang"

	*lokasi2 = Address{"Semarang", "Jawa Tengah", "Indonesia"} // Data #2 (memory)
	//memprogram seluruh variable lokasi, bila me-reference Data yang sama sebelumnya, dipaksa untuk berpindah reference Data ke baru
	fmt.Println(lokasi1) // lokasi1 tidak berubah
	fmt.Println(lokasi2)
	fmt.Println(lokasi3)

	//membuat program function new
	rumah1 := new(Address)
	rumah2 := rumah1

	//rumah2.City = "Berastagi"
	rumah2.Province = "Medan"
	rumah2.Country = "Indonesia"

	fmt.Println(rumah1) //rumah1 ikut berubah
	fmt.Println(rumah2)

	//memanggil fungsi ChangeCountryToIndonesia() dengan paramter untuk pointer
	var ingan = Address{
		// variable ingan disini bukan pointer
		City:     "Sumba",
		Province: "Nusa Tenggara Timur",
		Country:  "",
	}

	//namun jika sudah punya pointer
	var InganPointer *Address = &ingan
	//cukup dengan demikian:
	ChangeCountryToIndonesia(InganPointer)

	ChangeCountryToIndonesia(&ingan) //untuk mengubah variable ingan menjadi pointer, cukup tambahkan operator & (AND)

	fmt.Println(ingan)

	//memanggil fungsi Menikah()
	idris := Laki{"Idris"}
	idris.Menikah()
	fmt.Println(idris.Nama)
}
