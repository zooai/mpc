// Copyright (C) 2026, Zoo Labs Foundation. All rights reserved.
// Zoo MPC — not used in production. Dockerfile runs mpcd directly from upstream.
package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	cmd := exec.Command("mpcd", append([]string{"start"}, os.Args[1:]...)...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr
	cmd.Stdin = os.Stdin
	cmd.Env = os.Environ()
	if err := cmd.Run(); err != nil {
		fmt.Fprintf(os.Stderr, "zoo-mpc: %v\n", err)
		os.Exit(1)
	}
}
