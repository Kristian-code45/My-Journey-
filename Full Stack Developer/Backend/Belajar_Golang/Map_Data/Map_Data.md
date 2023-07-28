	/*
		Tipe Data Map
		1. Pada Array atau Slice, untuk mengakses data, kita menggunakan index Number dimulai dari 0
		2. Map adalah tipe data lain yang berisikan kumpulan data yang sama, namun kita bisa menentukan jenis tipe data index yang akan kita gunakan
		3. sederhanya, Map adalah tipe data kumpulan key-value (kata kunci-nilai), dimana kata kuncinya bersifat untuk, tidak boleh sama
		4. berbeda dengan Array dan Slice, jumlah data yang kita masukan ke dalam Map boleh sebanyak-banyaknya, asalkan kata kunci nya berbeda, jika kita gunakan kata kunci sama, maka secara otomatis data sebelumnya akan diganti dengan data baru
		syntax --> map[key]typeData{key:value}
	*/

    /*
		Function Map
		1. len(map) --> untuk mendapatkan jumlah data di map
		2. map[key] --> mengambil data di map dengan key
		3. map[key] = value --> mengubah data di map dengan key
		4. make(map[TypeKey]TypeValue) --> membuat map baru
		5. delete(map, key) --> menghapus data di map dengan key
	*/