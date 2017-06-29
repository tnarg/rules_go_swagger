package main

import (
	"fmt"

	"github.com/tnarg/rules_go_swagger/example/generated/client"
	"github.com/tnarg/rules_go_swagger/example/generated/models"
)

func main() {
	var pet models.Pet
	fmt.Printf("%#v\n", pet)
	fmt.Printf("%#v\n", client.DefaultSchemes)
}
