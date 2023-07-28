package main

import "fmt"

//membuat program interface
type HasName interface {
	GetName() string
}

func SayHallo(hasName HasName) {
	fmt.Println("Hello", hasName.GetName())
}

//membuat program implementasi interface dengan syntax struct
type Person struct {
	Name string
}

//membuat fungsi person memenuhi kontrak dan dapat menggunakan fungsi program interface
// struct untuk dapat mengikat kontrak dengan interface:
// struct perlu memenuhi syntax --> GetName() string <---
func (person Person) GetName() string {
	return person.Name
}

//membuat program implementasi interface dengan syntax struct
type Animal struct {
	Name string
}

func (animal Animal) GetName() string {
	return animal.Name
}

//membuat program interface kosong
func Ups(i int) interface{} {
	if i == 1 {
		return 1
	} else if i == 2 {
		return true
	} else {
		return "ups"
	}

}

func main() {
	//memanggil program implementasi interface
	person := Person{Name: "Idris"}
	SayHallo(person)

	//memanggil program implentasi interface
	animal := Animal{Name: "Kambing"}
	SayHallo(animal)

	//memanggil fungsi interface kosong
	kosong := Ups(0)
	fmt.Println(kosong)

	var data interface{} = Ups(3)
	fmt.Println(data)
}
