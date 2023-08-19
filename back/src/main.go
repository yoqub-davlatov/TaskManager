package main

import (
	"fmt"
	"log"
	"net/http"
	"github.com/gorilla/mux"
)

type Task struct {
	ID     string `json:"id"`
	Name   string `json:"name"`
	Detail string `json:"detail"`
	Date   string `json:"date"`
}

var tasks []Task

func homePage(w http.ResponseWriter, r *http.Request) {
	fmt.Println("hello from home page")
}

func getTask(w http.ResponseWriter, r *http.Request) {

}

func getTasks(w http.ResponseWriter, r *http.Request) {
}

func createTask(w http.ResponseWriter, r *http.Request) {

}

func deletTask(w http.ResponseWriter, r *http.Request) {

}

func updateTask(w http.ResponseWriter, r *http.Request) {

}

func handleRoutes() {
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/gettasks", getTasks).Methods("GET")
	router.HandleFunc("/gettask", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete/{id}", deletTask).Methods("DELETE")
	router.HandleFunc("/update/{id}", updateTask).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8080", router))
}

func main() {
	handleRoutes()
}
