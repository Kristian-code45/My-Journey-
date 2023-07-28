package main

import (
	"errors"
	"fmt"
)

// membuat fungsi Pembagi() menggunakan program error interface
func Pembagian(nilai int, pembagi int) (int, error) {
	if pembagi == 0 {
		return 0, errors.New("Pembagian dengan Nol")
	} else {
		return nilai / pembagi, nil
	}
}

func main() {
	var contohError error = errors.New("Ups Error")
	fmt.Println(contohError.Error())

	// The error built-in interface type is the conventional interface ferrors
	// representing an error condition, with the nil value representing no error.
	type error interface {
		Error() string
	}

	//memanggil fungsi pembagian() menggunakan program error interface
	hasil, err := Pembagian(100, 0)
	if err == nil {
		fmt.Println("Hasil", hasil)
	} else {
		fmt.Println("Error", err.Error())
	}
}
