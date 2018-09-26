#!/bin/bash
rm -f access.zip
rm -f access
GOOS=linux GOARCH=amd64 go build -ldflags='-s -w' access.go
zip access.zip access
