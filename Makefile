postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=stephen -e POSTGRES_PASSWORD=motunrayor -d postgres:12-alpine

#create database
createdb:
	docker exec -it postgres12 createdb --username=stephen --owner=stephen simpleBank

migrateup:
	migrate -path db/migration -database "postgresql://stephen:motunrayor@localhost:5432/simpleBank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://stephen:motunrayor@localhost:5432/simpleBank?sslmode=disable" -verbose down

#stop database
dropdb:
	docker exec -it postgres12 dropdb simpleBank

installsqlc:
	docker pull kjconroy/sqlc

sqlc:
	docker run --rm -v "%cd%:/src" -w /src kjconroy/sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc installsqlc sqlc test