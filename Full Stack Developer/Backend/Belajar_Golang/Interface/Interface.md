	/*
		Interface
		1. Interface adalah tipe data Abstract, dia tidak memiliki implementasi langsung
		2. Sebuah interface berisikan definisi-defisini method
		3. Biasanya interface digunakan sebagai kontrak
	*/

	/*
		Implementasi Interface
		1. Setiap tipe data yang sesuai dengan kontrak interface, secara otomatis dianggap sebagai interface tersebut
		2. sehingga kita tidak perlu mengimplementasikan interface secara manual
		3. hal ini agak berbeda dengan bahasa pemrograman yang lain ketika membuat interface, kita harus menyebutkan secara eksplisit akan menggunakan interface mana

	*/

    	/*
		Interface Kosong
		1. Go-Lang bukanlah bahasa pemrograman yang berorientasi objek
		2. Biasanya dalam pemrograman berorientasi objek, ada satu data parent di puncak yang bisa dianggap sebagai semua implementasi data yang ada di bahasa pemrograman tersebut
		3. contoh di Java ada java.lang.Object
		4. untuk menangani kasus seperti ini, di Go-Lang kita bisa menggunakan interface kosong
		5. Interface kosong adalah interface yang tidak memiliki deklarasi method satupun, hal ini membuat secara otomatis semua tipe data akan menjadi implementasinya
	*/

	/*
		Penggunaan Interface Kosong di Go-Lang
		1. Ada banyak contoh penggunaan interface kosong di Go-Lang seperti:
			a. fmt.Println(a..interface[])
			b. panic(v interface[])
			c. recover()interface{}
			d. dan lain-lain
	*/