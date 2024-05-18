package sub_test

import (
	"testing"

	"github.com/eric-gt/scratch/go/sub"
)

func TestSubPositive(t *testing.T) {
	if 5 != sub.Subfunc(10, 5) {
		t.Error("math is broken")
	}
}

func TestSubNegative(t *testing.T) {
	if 5 != sub.Subfunc(5, 10) {
		t.Error("huh. weird")
	}
}
