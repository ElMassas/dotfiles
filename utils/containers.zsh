#!/bin/bash

bash_test(){
    podman run --platform linux/arm64 -it --rm ubuntu bash
}

postgres(){
	podman run --platform linux/arm64 -d --name postgres-test -e POSTGRES_PASSWORD='password' -e POSTGRES_DB=mytestdb -p 5432:5432 postgres
}