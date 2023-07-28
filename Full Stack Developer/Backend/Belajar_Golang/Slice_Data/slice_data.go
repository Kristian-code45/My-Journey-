package main

import "fmt"

func main() {

	var bulan = [...]string{
		"Januari",
		"Feberuari",
		"Maret",
		"April",
		"Mei",
		"Juni",
		"Juli",
		"Agustus",
		"September",
		"Oktober",
		"November",
		"Desember",
	}

	var slice1 = bulan[4:7]
	fmt.Println(len(slice1))
	fmt.Println(cap(slice1))

	var slice2 = bulan[10:]
	fmt.Println(slice2)

	var slice3 = append(slice2, "Idris")
	fmt.Println(slice3)
	slice3[1] = "Bukan Desember"
	fmt.Println(slice3)

	newSlice := make([]string, 2, 5)

	newSlice[0] = "Idris"
	newSlice[1] = "Kristian"

	fmt.Println(newSlice)
	fmt.Println(len(newSlice))
	fmt.Println(cap(newSlice))

	copySlice := make([]string, len(newSlice), cap(newSlice))
	copy(copySlice, newSlice)
	fmt.Println(copySlice)

	iniArray := [...]int{1, 2, 3, 4, 5}
	iniSlice := []int{1, 2, 3, 4, 5}

	fmt.Println(iniArray)
	fmt.Println(iniSlice)

}
