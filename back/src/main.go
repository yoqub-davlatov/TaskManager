package main

import (
	"encoding/json"
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
	taskID := mux.Vars(r)
	flag := false
	for i := 0; i < len(tasks); i++ {
		if taskID["id"] == tasks[i].ID {
			json.NewEncoder(w).Encode(tasks[i])
			flag = true
			break
		}
	}
	if !flag {
		json.NewEncoder(w).Encode(map[string]string{"status" : "Error"})
	}
}

func getTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
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
	router.HandleFunc("/gettask/{id}", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete/{id}", deletTask).Methods("DELETE")
	router.HandleFunc("/update/{id}", updateTask).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8082", router))
}

func main() {
	tasks = append(tasks, Task{ID: "1", Name: "first", Detail: "first detail", Date: "2023-08-19"})
	tasks = append(tasks, Task{ID: "2", Name: "second", Detail: "second detail", Date: "2023-08-19"})
	handleRoutes()
}
