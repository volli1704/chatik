FROM migrate/migrate:4 AS base
WORKDIR /migrations
COPY ./deployments/database/migrations /migrations

FROM base AS pre_new
ARG NAME
RUN migrate create -ext sql -dir /migrations -seq ${NAME}

FROM scratch AS new
COPY --from=pre_new /migrations/* /

FROM base AS migrate-u
ARG URL
RUN migrate -database ${URL} -path . up

FROM base AS migrate-d
ARG URL
RUN migrate -database ${URL} -path . down -all

FROM base AS migrate-f
ARG URL
ARG VERSION
RUN migrate -database ${URL} -path . force ${VERSION}