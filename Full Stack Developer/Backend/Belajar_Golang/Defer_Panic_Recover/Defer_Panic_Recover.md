	/*
		Defer
		1. Defer Function adalah function yang bisa kita jadwalkan untuk dieksekusi setelah sebuah function selesai di eksekusi
		2. Defer function akan selalu dieksekusi walaupun terjadi error di function yang dieksekusi

	*/

    /*
		Panic
		1. Panic function adalah function yang bisa kita gunakan untuk menghentikan program
		2. Panic function biasanya dipanggil ketika terjadi error pada saat program kita berjalan
		3. saat panic Function dipanggil, program akan terhenti, namun defer function tetap akan dieksekusi

	*/


	/*
		Recover
		1. Recover adalah function yang bisa kita gunakan untuk menangkap data panic
		2. dengan recover proses panic akan terhenti, sehingga program akan tetap berjalan

	*/