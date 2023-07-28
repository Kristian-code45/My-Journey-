package main

import "fmt"

func main() {
	counter := 1

	for counter <= 10 {
		fmt.Println("Perulangan ke", counter)
		counter++
	}

	for hitung := 1; hitung <= 10; hitung++ {
		fmt.Println("Pengulangan untuk ", hitung)
	}

	slice := []string{"Idris", "Kristian", "Bukit"}

	// ketika menggunakan ini, kurang efisien
	fmt.Println(slice[0])
	fmt.Println(slice[1])
	fmt.Println(slice[2])

	// maka dapat menggunakan ini, sebagai gantinya
	for i := 0; i < len(slice); i++ {
		fmt.Println(slice[i])
	}

	// Kode Program For Range
	names := []string{"Edo", "Sejahtera", "Bukit"}
	for index /*<--key*/, name /*<--value*/ := range names {
		fmt.Println("index", index, "=", name)
	}
	// atau
	for i, value := range slice {
		fmt.Println("Index", i, "=", value)
	}
	// atau
	for _ /*menyatakan kepada Go-Lang bahwa nilai ini tidak diperlukan*/, nilai := range slice {
		fmt.Println(nilai)
	}

	//Menggunakan Map Method
	orang := make(map[string]string)
	orang["nama"] = "Kevin"
	orang["Pekerjaan"] = "Data Scientist"

	for key, values := range orang {
		fmt.Println(key, "=", values)
	}
}
