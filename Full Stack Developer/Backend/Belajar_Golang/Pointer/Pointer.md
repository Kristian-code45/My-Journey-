	/*
				Pass by Value
				1. Secara default di Go-Lang semua variable itu di passing by value, bukan by reference
				2. Artinya, jika kita mengirim sebuah variable ke dalam function, method atau variable lain, sebenarnya yang dikirim adalah duplikasi value nya
		       a. pass by value --> data dari address1 di salin ke address2
						  i. problem --> jadi di dalam memory ada 2 address, yakni address1 dan address2
	*/

    /*
		    Pointer --> Pass by Reference
		    1. Pinter adalah kemampuan membuat reference ke lokasi data di memory yang sama, tanpa menduplikasi data yang sudah ada
		    2. sederhanya, dengan kemampuan pointer kita bisa membuat pass by reference
		        a. Pass by Reference ---> data dari address1 juga adalah data dari address2
				        i. problem --> jadi di dalam memory hanya ada 1 address, address1 dan address2 berbagi data yang sama

		    cara menggunakan pointer di Go-Lang
		    1. Operator & (AND)
		      a. untuk membuat sebuah variable dengan nilai pointer ke variable yang lain, kita bisa menggunakan operator & diikuti dengan nama variable nya
	*/

    /*
	   Operator * (STAR)
	   1. Saat kita mengubah variable pointer, maka yang berubah hanya variable tersebut.
	   2. semua variable yang mengacu ke data yang sama tidak akan berubah
	   3. jika kita ingin mengubah seluruh variable yang mengacu ke data tersebut, kita bisa menggunakan operator *
	*/

    /*
	   Function New
	   1. Sebelumnya untuk membuat pointer dengan menggunakan operator & (AND)
	   2. Go-Lang juga memiliki function new yang bisa digunakan untuk membuat pointer
	   3. Namun function new hanya mengembalikan pointer ke data kosong, artinya tidak ada data awal
	*/

    /*
	   Pointer di Function
	   1. saat kita membuat parameter di function, secara default adalah pass by value, artinya data akan di copy lalu dikirim ke function tersebut.
	   2. oleh karena itu, jika kita mengubah data di dalam function, data yang aslinya tidak akan pernah berubah.
	   3. hal ini membuat variable menjadi aman, karena tidak akan bisa diubah
	    4. namun kadang kita ingin membuat function yang bisa mengubah data asli parameter tersebut
	    5. untuk melakukan ini, kita juga bisa menggunakan pointer di function
	    6. untuk menjadikan sebuah parameter menjadi pointer, kita bisa menggunakan operator * (STAR) di paramaternya
	*/

    /*
	   Note:
	   jika membuat struct yang cukup besar, usahakan buat parameter jadi pointer, karena kalo datanya terlalu besar. contoh datanya adalah 50 field di struct, maka setiap panggil function, data tersebut akan di duplikasi di memory.
	   jadi semakin banyak memanggil parameter di dalam function, pemakaian memory akan semakin membesar
	*/

	/*
	   Pointer di Method
	   1. Walaupun method akan menempel di struct, tapi sebenarnya data struct yang diakses di dalam method adalah pass by value\
	   2. sangat direkomendasikan menggunakan pointer di method, sehingga tidak boros memory karena harus selalu diduplikasi ketika memanggil method

	*/
