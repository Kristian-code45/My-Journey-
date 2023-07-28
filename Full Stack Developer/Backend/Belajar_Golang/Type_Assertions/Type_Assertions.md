	/*
		Type Assertions
		1. Type Assertions merupakan kemampuan merubah tipe data menjadi tipe data yang diinginkan
		2. fitur ini sering sekali digunakan ketika kita bertemu dengan data interface kosong

		Note:
		perlu HATI-HATI dalam menggunakan Type Assertions, dan pastikan tipe data nya terlebih dahulu
	*/

    /*
		Type Assertions Menggunakan Switch
		1. Saat salah menggunakan type assertions, maka bisa berakibat terjadi panic di aplikasi kita
		2. jika panic dan tidak ter-recover, maka otomatis program kita akan mati
		3. agar lebih amaan, sebaiknya kita menggunakan switch expression untuk melakukan type assertions

	*/