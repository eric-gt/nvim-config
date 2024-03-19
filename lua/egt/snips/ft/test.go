package main

import (
	"fmt"
)

type AStruct struct {
	DidError bool
}

func Something() (AStruct, error) {
	if err := SomethingElse(false); err != nil {

		return AStruct{}, err
	}

	return AStruct{}, nil
}

func SomethingElse(shouldError bool) error {
	if shouldError {
		return fmt.Errorf("error!")
	}
	return nil
}
