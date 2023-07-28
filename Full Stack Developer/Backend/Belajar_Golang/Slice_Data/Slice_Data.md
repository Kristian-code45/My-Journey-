	/*
		Tipe Data Slice
		1. Tipe data slice adalah potongan dari data array
		2. slice mirip dengan Array, yang membedakana adalah ukuran Slice bisa berubah
		3. slide dan Array selalu terkoneksi, dimana Slice adalah data yang mengakses sebagaian atau seluruh data di Array

		Detail Tipe Data Slice
		1. Tipe Data Slice memiliki 3 data, yaitu pointer, length, dan capacity
		2. Pointer adalah penunjuk data pertama di array para slice
		3. Length adalah panjangan dari slice, dan
		4. Capacity adalah kapasitas dari slice, dimana length tidak boleh lebih dari capacity

		Membuat Slice dari Array
		1. array[low:high] --> membuat slice dari array dimulai index low sampai index sebelum high
		2. array[low:] --> membuat slide dari array dimulai index low sampai index akhir di array
		3. array[:high] --> membuat slice dari array dimulai index 0 sampai index sebelum high
		4. array[:] --> membuat slice dari array dimulai index 0 sampai index akhir di array

		Function Slice
		1. len(slice) --> untuk mendapatkan panjang
		2. cap(slice) --> untuk mendapatkan kapasitas
		3. append(slice, data) --> membuat slice baru dengan menambah data ke posisi terakhir slice, jika kapasitas sudah penuh, maka akan membuat array baru
		4. make([]TypeData, length, capacity) --> membuat slice baru
		5. copy(destination, source) --> menyalin slice dari source ke destination
	*/

    /*
		Note:
		Bila Array yang sudah ada tidak mempu menampung nilai yang baru, maka Go-Lang akan membuat array yang baru.
		sehingga Array yang sudah ada, tidak akan memiliki perubahan.
		yang terkena dampak dari pengurangan dan penambahan nilai adalah array yang baru.
	*/

	/*
		Note:
		Hati-hati saat membuat array
		1. saat membuat array, kita harus berhati-hati, jika salah, maka yang kita buatkan bukanlah array, melainkan slice
	*/