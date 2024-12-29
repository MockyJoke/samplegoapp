package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, World!!!!")
	})

	port := ":8080"
	fmt.Printf("Starting server on http://localhost%s\n", port)
	if err := http.ListenAndServe(port, nil); err != nil {
		fmt.Printf("Error starting server: %s\n", err)
	}
}
