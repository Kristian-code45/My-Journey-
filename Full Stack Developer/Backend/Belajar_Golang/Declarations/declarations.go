package main

import (
	"fmt"
)

func main() {
	type noKtp string

	var noKtpIdris noKtp = "65435772345"
	fmt.Println(noKtpIdris)

	type noHp int

	var nomorHP noHp = 1929834234
	fmt.Println(nomorHP)
}
