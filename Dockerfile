# Zoo MPC — upstream Lux MPC with Zoo custody policy
FROM ghcr.io/luxfi/mpc:latest
ENV MPC_ORG=zoo
ENV MPC_THRESHOLD=2
ENV MPC_PARTIES=3
ENV MPC_BRAND_NAME=Zoo
