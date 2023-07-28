package main

import "fmt"

//membuat fungsi NewMap() dengan return nil
func NewMap(name string) map[string]string {
	if name == "" {
		return nil
	} else {
		return map[string]string{
			"name": name,
		}
	}
}

func main() {
	//cara sederhana untuk memanfaatkan nil
	var person map[string]string = nil
	fmt.Println(person)

	//case: memanfaatkan fungsi NewMap() tanpa return nil
	if person["name"] == "" {
		fmt.Println("Data Kosong")
	} else {
		fmt.Println(person)
	}

	//memanggil fungsi NewMap() dengan return nil
	person1 := NewMap("Idris")
	fmt.Println(person1)

	//case: memanfaatkan fungsi NewMap() dengan return nil
	data := NewMap("")
	if data == nil {
		fmt.Println("Data Kosong")
	} else {
		fmt.Println(data)
	}

}
