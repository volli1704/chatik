package user

import (
	"chatik/internal/handlers"
	"fmt"

	"github.com/gin-gonic/gin"
)

const (
	userURL = "/users/:id"
	usersURL = "/users"
)

type handler struct {}

func NewHandler() handlers.Handler {
	return &handler{}
}

func (h *handler) Register(router *gin.Engine) {
	router.GET(usersURL, h.GetList)
	router.POST(usersURL, h.CreateUser)
	router.GET(userURL, h.GetUser)
	router.PUT(userURL, h.UpdateUser)
	router.DELETE(userURL, h.DeleteUser)
}

func (h *handler) GetList(c *gin.Context) {
	c.String(200, "List of users")
}

func (h *handler) GetUser(c *gin.Context) {
	c.String(200, fmt.Sprintf("Single user with ID: %s", c.Param("id")))
}

func (h *handler) CreateUser(c *gin.Context) {
	c.String(201, fmt.Sprintf("Create user with ID: %s", c.Param("id")))
}

func (h *handler) UpdateUser(c *gin.Context) {
	c.String(204, fmt.Sprintf("Update user with ID: %s", c.Param("id")))
}

func (h *handler) DeleteUser(c *gin.Context) {
	c.String(204, fmt.Sprintf("Delete user with ID: %s", c.Param("id")))
}