package main

import "testing"

func TestAdd(t *testing.T) {
	if 3 != Add(1, 2) {
		t.Error("failed to add numbers")
	}
}

func TestAdd5(t *testing.T) {
	if 10 != Add(5, 5) {
		t.Error("what's wrong with five?")
	}
}
