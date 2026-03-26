.PHONY: build update tidy

build:
	go build -o bulb bulb.go
	chmod +x bulb
	cp bulb ~/bin/bulb

update:
	go get -u ./...
	go mod tidy

tidy:
	go mod tidy
