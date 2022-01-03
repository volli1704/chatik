include .env
export

m-new:
	docker build --target new -f ./deployments/database/migrator.Dockerfile --output type=local,dest=./deployments/database/migrations/ --build-arg NAME=$(NAME) .

m-up:
	docker build --target migrate-u -f ./deployments/database/migrator.Dockerfile --build-arg URL="postgresql://${DB_USER}:${DB_PASS}@host.docker.internal:5432/${DB_NAME}?sslmode=disable" .

m-down:
	docker build --target migrate-d -f ./deployments/database/migrator.Dockerfile --build-arg URL="postgresql://${DB_USER}:${DB_PASS}@host.docker.internal:5432/${DB_NAME}?sslmode=disable" .

m-force:
	docker build --target migrate-f -f ./deployments/database/migrator.Dockerfile --build-arg URL="postgresql://${DB_USER}:${DB_PASS}@host.docker.internal:5432/${DB_NAME}?sslmode=disable" --build-arg VERSION=$(V) .