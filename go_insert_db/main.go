package main

import (
	"bufio"
	"database/sql"
	"encoding/json"
	"log"
	"os"
	"time"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

type User struct {
	Age  int    `json:"age"`
	Name string `json:"name"`
	Role string `json:"role"`
}

type LogEntry struct {
	User  User      `json:"user"`
	Dist  string    `json:"dist"`
	Level string    `json:"level"`
	Msg   string    `json:"msg"`
	Src   string    `json:"src"`
	Time  time.Time `json:"time"`
}

func initDB() (*sql.DB, error) {
	db, err := sql.Open("postgres", os.Getenv("POSTGRES_URL"))
	if err != nil {
		return nil, err
	}
	_, err = db.Exec("CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY, age INT, name VARCHAR(500), role VARCHAR(15))")
	if err != nil {
		return nil, err
	}
	return db, nil
}

func processLogFile(filename string, db *sql.DB) error {
	tx, err := db.Begin()
	if err != nil {
		return err
	}

	defer func() {
		if err != nil {
			tx.Rollback()
		}
	}()

	file, err := os.Open(filename)
	if err != nil {
		return err
	}

	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		var logEntry LogEntry
		err = json.Unmarshal(scanner.Bytes(), &logEntry)
		if err != nil {
			return err
		}

		_, err = tx.Exec("INSERT INTO users (age, name, role) VALUES ($1, $2, $3)", logEntry.User.Age, logEntry.User.Name, logEntry.User.Role)
		if err != nil {
			return err
		}
	}

	if err = scanner.Err(); err != nil {
		return err
	}

	return tx.Commit()
}

func main() {

	err := godotenv.Load()
	if err != nil {
		log.Println("Warning: .envファイルが見つかりません")
	}

  if len(os.Args) != 2 {
		log.Fatal("ファイルを一つ指定してください")
	}

	db, err := initDB()
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	filePath := os.Args[1]

	err = processLogFile(filePath, db)
	if err != nil {
		log.Fatal(err)
	}
}
