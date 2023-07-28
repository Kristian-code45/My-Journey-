package main

import "fmt"

func main() {

	var nilaiAkhir = 90
	var presensi = 80

	var lulus_nilai_akhir bool = nilaiAkhir > 80
	var lulus_presensi bool = presensi >= 80

	var lulus bool = lulus_nilai_akhir && lulus_presensi

	fmt.Println(lulus)

}
