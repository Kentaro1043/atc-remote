#!/bin/bash

# Change files to download for each architecture
architecture=$(uname -m)

if [ "$architecture" = "x86_64" ]; then
	curl -fOL "https://github.com/coder/code-server/releases/download/v${CODE_VERSION}/code-server_${CODE_VERSION}_amd64.deb"
	dpkg -i "/code-server_${CODE_VERSION}_amd64.deb"
elif [ "$architecture" = "aarch64" ]; then
	curl -fOL "https://github.com/coder/code-server/releases/download/v${CODE_VERSION}/code-server_${CODE_VERSION}_arm64.deb"
	dpkg -i "/code-server_${CODE_VERSION}_arm64.deb"
fi
