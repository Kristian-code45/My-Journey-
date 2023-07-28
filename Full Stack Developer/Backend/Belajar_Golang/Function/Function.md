	/*
		Function
		1. Sebelumnya, kita sudah mengenal sebuah function yang wajib dibuat agar program kita bisa berjalan, yaitu function main
		2. function adalah sebuah blok kode yang sengaja dibuat dalam program agar bisa digunakan berulang-ulang
		3. cara membuat function sangat sederhana, hanya dengan menggunakan kata kunci func lalu diikuti dengan nama function nya dan blok kode isi functionnya
		4. setelah membuat function, kita bisa mengeksekusi function tersebut dengan memanggilnya menggunakan kata kunci nama functionnya diikuti tanda kurung buka, dan kurung tutup
	*/

    /*
		Function Parameter
		1. saat membuat function, kadang-kadang kita membutuhkan data dari luar, atau kita sebut parameter
		2. kita bisa menambahkan parameter di function bisa lebih dari satu
		3. parameter tidaklah wajib, jadi kita bisa membuat function tanpa parameter seperti sebelumnya yang sudah kita buat
		4. namun jika kita menambahkan parameter di function, maka ketika memanggil function tersebut, kita wajib memasukan data ke parameternya
	*/

    /*
		Function Return Value
		1. Function bisa mengembalikan data
		2. untuk memberitahu bahwa function mengembalikan data, kita harus menuliskan tipe data kembalian dari function tersebut
		3. jika function tersebut kita deklarasikan dengan tipe data pengembalian, maka wajib di dalam function nya kita harus mengembalikan data
		4. untuk mengembalikan data dari function, kita bisa menggunakan kata kunci return, diikuti dengan datanya
	*/

    /*
		Returning Multiple Values
		1. Function tidak hanya dapat mengembalikan satu value, tetapi juga bisa multiple value
		2. untuk memberitahu jika function mengembalikan multiple value, kita harus menulis semua tipe data return value nya di function
	*/
    
    /*
		Menghiraukan Return Value
		1. Multiple return value wajib ditangkap semua value nya
		2. jika kita ingin menghiraukan return value tersebut, ktia bisa menggunakan tanda _ (garis bawah)
	*/

    /*
		Named Return Values
		1. biasanya saat kita memberi tahu bahwa sebuah function mengembalikan value, maka kita hanya mendeklarasikan tipe data return value di function
		2. namun kita juga bisa membuat variable secara langsung di tipe data return function  nya
	*/

    /*
		Variadic Function
		1. Parameter yang berada di posisi terakhir, memiliki kemampuan dijadikan sebuah varargs
		2. varargs artinya datanya bisa menerima lebih dari satu input, atau anggap saja semacam array.
		3. apaa bedanya dengan parameter biasa dengan tipe data array?
			a. jika parameter tipe array, kita wajib membuat array terlebih dahulu sebelum mengirimkan ke function
			b. jika parameter menggunakan varargs, kita bisa langusng mengirim data nya, jika lebih dari satu, cukup gunakan tanda koma
	*/

    /*
		Note!!
		bagaimana sudah membuat variadic function, namun ternyata memiliki variable dalam bentuk slice?
		bisa tidak, memasukan slice ke dalam variadic function?
	*/

    /*
		Function Value
		1. Function adalah first class citizen
		2. Function juga merupakan tipe data, dan bisa disimpan dalam variable
	*/

    /*
		Function as Parameter
		1. Function tidak hanya bisa kita simpan di dalam variable sebagai value
		2. Namun juga bisa kita gunakan sebagai parameter untuk function lain
	*/

    /*
		Function Type Declarations
		1. Kadang jika function terlalu panjang, agak ribet untuk menuliskannya di dalam parameter
		2. Type Declarations juga bisa digunakan untuk membuat alias function, sehingga akan mempermudah kita menggunakan function sebagai parameter
		syntax --> type Filter func(string) string
	*/

    /*
		Anonymous Function
		1. Sebelumnya setiap membuat function, kita akan selalu memberikan sebauh nama pada function tersebut
		2. Namun kadang ada kalanya lebih mudah membuat function secara langsung di variable atau parameter tanpa harus membuat function terlebih dahulu
		3. hal tersebut dinamakan anonymous function, atau function tanpa nama
	*/

    /*
		Recursive Function
		1. Recursive Function adalah function yang memanggil function dirinya sendiri
		2. kadang dalam pekerjaan, kita sering menemui kasus dimana menggunakan recursive function lebih mudah dibandingkan tidak menggunakan recursive function
		3. contoh kasus yang lebih mudah diselesaikan menggunakan recursive adalah Factorial
	*/


