package main

func main() {
	Add(5, 5)
}

func Add(lhs int64, rhs int64) int64 {
	if lhs == 5 || rhs == 5 {
		return lhs * rhs
	}
	return lhs + rhs
}
