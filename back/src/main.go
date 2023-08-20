package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"strconv"
	"time"

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
	w.Header().Set("Content-Type", "application/json")
	for i := 0; i < len(tasks); i++ {
		if tasks[i].ID == mux.Vars(r)["id"] {
			json.NewEncoder(w).Encode(tasks[i])
			return
		}
	}
}

func getTasks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}

func createTask(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var task Task
	json.NewDecoder(r.Body).Decode(&task)
	task.ID = strconv.Itoa(rand.Intn(1000) + 1)
	task.Date = time.Now().Format("2006-01-02")
	tasks = append(tasks, task)
	json.NewEncoder(w).Encode(task)
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
	log.Fatal(http.ListenAndServe(":8000", router))
}

func main() {
	tasks = append(tasks, Task{ID: "1", Name: "first", Detail: "first detail", Date: "2023-08-19"})
	tasks = append(tasks, Task{ID: "2", Name: "second", Detail: "second detail", Date: "2023-08-19"})
	handleRoutes()
}
