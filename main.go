// Copyright (C) 2026, Zoo Labs Foundation. All rights reserved.
// Zoo MPC — Threshold signing service for Zoo Network treasury and governance.
// Thin wrapper around luxfi/mpc with Zoo-specific custody policy.
package main

import (
	"fmt"
	"os"
)

const version = "0.1.0"

func main() {
	if len(os.Args) > 1 && (os.Args[1] == "version" || os.Args[1] == "--version") {
		fmt.Printf("zoo-mpc %s\n", version)
		os.Exit(0)
	}

	// Zoo MPC delegates to the upstream Lux MPC service.
	// In production, use ghcr.io/luxfi/mpc with Zoo-specific env vars:
	//   MPC_ORG=zoo
	//   MPC_THRESHOLD=2  (2-of-3 for treasury)
	//   MPC_PARTIES=3
	//   MPC_BRAND_NAME=Zoo
	fmt.Println("Zoo MPC — use ghcr.io/luxfi/mpc with Zoo configuration")
	fmt.Println("Environment variables:")
	fmt.Println("  MPC_ORG=zoo")
	fmt.Println("  MPC_THRESHOLD=2")
	fmt.Println("  MPC_PARTIES=3")
	fmt.Println("  MPC_BRAND_NAME=Zoo")
}
