package main

import "fmt"

func random() interface{} {
	return "Idris Kristian Bukit" // Tipe Data --> String
}

func main() {
	result := random()
	resultString := result.(string)
	fmt.Println(resultString)

	resultInt := result.(int) // ini akan terjadi panic, karena return dari random interface merupakan bertipe string, bukan integer.
	fmt.Println(resultInt)

	// membuat Type Assertions Switch
	result = random()
	switch value := result.(type) {
	case string:
		fmt.Println("Value", value, "is String")
	case int:
		fmt.Println("Int", value, "is Int")
	default:
		fmt.Println("Unknown")
	}

}
