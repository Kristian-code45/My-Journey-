package main

//meng-import func yang berasal dari GOLANG/importIt
import (
	Package "Belajar_Golang/package"
	"fmt"
)

func main() {
	idris := Package.SayHallo("Idris")

	fmt.Println(idris)

	//memanggil function yang ada di dalam file access_modifier.go yang terdapat di dalam direktori bernama package
	coba1 := Package.Akseslah("Terserah") // import.go dapat mengakses func Akseslah, karena nama diawali dengan huruf besar
	//coba2 := Package.akseslah("Terserah") //import.go tidak dapat mengakses func akseslah, karena nama diawali dengan huruf kecil

	fmt.Println(coba1)
	//fmt.Println(coba2)

	//memanggil variable yang ada di dalam file access_modifier.go yang terdapat di dalam direktori bernama package
	fmt.Println(Package.Application) // import.go dapat mengakses variable Application, karena nama diawali dengan huruf besar
	//fmt.Println(Package.version)     //import.go tidak dapat mengakses variabel version, karena nama diawali dengan huruf kecil

}
