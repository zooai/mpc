# Zoo MPC — runs upstream luxfi/mpc with Zoo branding
FROM ghcr.io/luxfi/mpc@sha256:d45bec3cff96311f3b97e0c23fa1fbf894c1b6c88b099cc8620ed578d5164048 AS upstream

FROM alpine:3.21
RUN apk add --no-cache ca-certificates curl
COPY --from=upstream /usr/local/bin/mpcd /usr/local/bin/mpcd

ENV MPC_ORG=zoo \
    MPC_BRAND_NAME=Zoo \
    MPC_THRESHOLD=2 \
    MPC_PARTIES=3

EXPOSE 8081
ENTRYPOINT ["mpcd", "start"]
