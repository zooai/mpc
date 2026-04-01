FROM alpine:3.21
RUN apk add --no-cache ca-certificates curl
ENV MPC_ORG=zoo MPC_THRESHOLD=2 MPC_PARTIES=3 MPC_BRAND_NAME=Zoo
COPY main.go /app/main.go
ENTRYPOINT ["echo", "Zoo MPC — configure via K8s env vars"]
