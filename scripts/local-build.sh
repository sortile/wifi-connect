#!/bin/bash

# Copyright 2023 Balena.io
# Modifications Copyright 2024 Sortile
#
# Licensed under the Apache License, Version 2.0 (the "License");
#
# Modifications:
# - local-build.sh now builds for the host architecture instead of cross-compiling

set -ev

if [ -z "$1" ]; then
	printf 'Rust compilation target not specified\n'
	exit 1
fi

TARGET=$1

# Build the project
cargo build --release --target=$TARGET

# Strip the binary to reduce its size
strip target/$TARGET/release/wifi-connect