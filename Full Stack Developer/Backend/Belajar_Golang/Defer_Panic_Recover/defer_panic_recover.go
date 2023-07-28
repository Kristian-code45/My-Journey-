package main

import "fmt"

//membuat fungsi logging()
func logging() {
	fmt.Println("Selesai memanggil function")
}

//membuat fungsi runApplication() dengan defer built-in function
func runApplication(value int) {
	defer logging() //menyatakan kepada Go-Lang bahwa selesai menjalankan runApllication(), maka akhiri dengan mengeksekusi logging()
	fmt.Println("Run Application")
	result := 10 / value
	fmt.Println("Result", result)
	/*
		Case:
		func runApplication(value int){
			fmt.Println("Run Application")
			result := 10/value <-- jika value adalah 0, maka program logging tidak akan dijalankan justru program mengalami panic runtime error: integer divide by zero
			fmt.Println("Result", result)
			logging()
		}
		Solution:
		func runApplication(value int){
			defer logging() <-- defer lalu diikuti function selalu diletakan pada bagian atas dari blok kode
			fmt.Println("Run Application")
			result := 10/value <-- jika value adalah 0, maka program logging tidak akan dijalankan justru program mengalami panic runtime error: integer divide by zero,
									namun karena ada program defer, maka tidak peduli line ini mengalami error, logging() akan tetap dijalankan
			fmt.Println("Result", result)

		}
	*/
}

//membuat endApp()
func endApp() {
	// membuat program recover
	message := recover()
	fmt.Println("Terjadi Error: ", message)
	fmt.Println("Aplikasi Selesai")
}

//membuat runApp() dengan panic built-in function
func runApp(error bool) {
	defer endApp() // <-- recover function di buat di dalam defer function
	if error {
		panic("Aplikasi Bermasalah")
	}
	fmt.Println("Aplikasi Berjalan")
}

func main() {
	//memanggil fungsi runApplication()
	runApplication(1)

	//memanggil runApp() dengan panic built-in function
	//runApp(true)

	//memanggil runApp() dengan panic dan recover built-in function
	runApp(true)
}
