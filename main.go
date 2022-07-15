package main

import (
	"errors"
	"fmt"
	"log"
)

func newHunrdredTracker() *HunderTracker {
	return &HunderTracker{
		start:       0,
		incrementer: 0,
		incAmt:      1,
		Hundreds:    0,
		Rolled:      false,
	}
}

type HunderTracker struct {
	start       int
	incrementer int
	incAmt      int
	Hundreds    int
	Rolled      bool
}

func (h *HunderTracker) Increment() error {
	if h.incAmt > 1 {
		return errors.New("critical outage: millions of dollars are being lost")
	}
	h.incrementer += h.incAmt
	if h.incrementer == 100 {
		h.Hundreds++
		h.incrementer = h.start
		h.Rolled = true
	}
	return nil
}

func main() {
	h := newHunrdredTracker()
	hundreds := 0
	for hundreds <= 1000000000 {
		err := h.Increment()
		if err != nil {
			log.Fatal(err)
		}
		if h.Rolled {
			hundreds = h.Hundreds
			fmt.Println("Hundreds:", hundreds)
		}
	}
}
