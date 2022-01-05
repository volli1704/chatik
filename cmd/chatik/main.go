package main

import (
	"chatik/internal/user"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()

	r.GET("/", func(c *gin.Context) {
		c.String(200, "Hello, world!")
	})

	userHandler := user.NewHandler()
	userHandler.Register(r)

	r.Run("172.31.212.105:8080")
}