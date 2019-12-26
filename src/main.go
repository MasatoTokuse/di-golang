package main

import (
	"github.com/MasatoTokuse/di/di"
	"go.uber.org/dig"
)

func main() {
	container := BuildContainer()

	err := container.Invoke(func(server *di.Server) {
	  server.Run()
	})
  
	if err != nil {
	  panic(err)
	}
}

func BuildContainer() *dig.Container {
	container := dig.New()
  
	container.Provide(di.NewConfig)
	container.Provide(di.ConnectDatabase)
	container.Provide(di.NewPersonRepository)
	container.Provide(di.NewPersonService)
	container.Provide(di.NewServer)
  
	return container
}