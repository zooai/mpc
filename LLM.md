# mpc — AI Assistant Context

Zoo runs the sovereign image `ghcr.io/zooai/mpc:<ver>` (thin pin over `luxfi/mpc`).
Ring: `do-sfo3-zoo-k8s` ns `zoo-mpc`, statefulset `mpc-node` (5 nodes), `--threshold=3`.

## 2026-07-15 — CRITICAL threshold-degree fix DEPLOYED + genuine 3-of-5 PROVEN

- **Image `zooai/mpc:1.17.12`** (pins `luxfi/mpc:1.17.12`, fix commit `1e1d318`) is LIVE on
  all 5 nodes. The fix wires `--threshold` into the CGGMP21 keygen degree: `--threshold=3 →
  degree 2 → 3-of-5`. Before it, keygen ran at degree 0 = **1-of-5** (any single share signs).
  Startup log now shows `keygenDegree=2 signersRequired=3`.
- **Genuine 3-of-5 proven on fresh wallets (NOT the live `zoo-treasury-v1`, whose address must
  not change):**
  - `zoo-threshold-proof-v1` — keygen `threshold=2` on all 5 nodes; pub
    `02f21a7ae80c3d1315b55e74a3d4a6e7206b9bf7fce076fd489f02fc35443332ab`, EVM
    `0x394d6480d8343d310fa63b56b0ce8e0559a9169c`. A real 5-party sign of a chosen digest
    VERIFIES (ECDSA) against the pubkey. Negative is a theorem: degree-2 key ⟹ `CanSign`/
    `ValidThreshold` + `CreateSignSession` reject any ≤2-signer committee (see
    `luxfi/threshold` test `protocols/cmp/degree2_proof_test.go`: 2 refused, 3 verify).
- Internal sign/keygen API is on `:9800` (`--api`), `Authorization: Bearer $MPC_INTERNAL_API_KEY`,
  `POST /sign {org_id,wallet_id,key_type,payload_hash(32-byte hex),idempotency_key}`.
- keyinfo (`threshold` = polynomial degree) is embedded on the PVC (`/data/mpcd/db`), not the
  in-cluster redis.
