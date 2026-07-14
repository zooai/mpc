# Zoo MPC — runs upstream luxfi/mpc (the canonical lux-native mpcd) with Zoo
# branding. Sovereign version tag MIRRORS the wrapped upstream: zooai/mpc:v1.17.9
# == luxfi/mpc:v1.17.9 (same convention as hanzoai/mpc:v1.17.4). Patch-pin only —
# never :latest, never a lazy major bump.
FROM ghcr.io/luxfi/mpc:v1.17.9 AS upstream

FROM alpine:3.21
RUN apk add --no-cache ca-certificates curl
COPY --from=upstream /usr/local/bin/mpcd /usr/local/bin/mpcd

# Zoo threshold ring defaults: 3-of-5 (the runtime StatefulSet passes --threshold
# explicitly and overrides these; kept as documentation of the Zoo topology).
ENV MPC_ORG=zoo \
    MPC_BRAND_NAME=Zoo \
    MPC_THRESHOLD=3 \
    MPC_PARTIES=5

EXPOSE 8081
ENTRYPOINT ["mpcd", "start"]
