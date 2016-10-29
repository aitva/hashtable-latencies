package main

import (
	"log"
	"net/http"
	"sync"
)

const maxMapSize = 250000

type server struct {
	sync.Mutex
	IDs   map[int][]byte
	Count int
}

func (s *server) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	buf := make([]byte, 1024)

	s.Lock()
	s.IDs[s.Count] = buf
	if s.Count >= maxMapSize {
		delete(s.IDs, s.Count-maxMapSize)
	}
	s.Count++
	s.Unlock()

	w.Write([]byte("OK"))
}

func main() {
	srv := &server{
		IDs: make(map[int][]byte),
	}
	log.Fatal(http.ListenAndServe(":8080", srv))
}
