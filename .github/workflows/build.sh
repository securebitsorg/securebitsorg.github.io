#1/usr/bin/env bash

main() {
  Hugo_VERSION="0.148.1"

  export TZ="Europe/Berlin"

  # Install Hugo
  echo "Installing Hugo version $Hugo_VERSION..."
  curl -LJO "https://github.com/gohugoio/hugo/releases/download/v$Hugo_VERSION/hugo_extended_$Hugo_VERSION_linux-amd64.tar.gz"
  tar -xzf "hugo_extended_$Hugo_VERSION_linux-amd64.tar 
  cp hugo /opt/buildhome
  rm LICENSE.txt README.md hugo_extended_$Hugo_VERSION_linux-amd64.tar.gz

  echo "Hugo version $Hugo_VERSION installed successfully."
  echo Go: "${go version}"
  echo "Hugo version: $(hugo version)"
  echo Node.js version: "$(node -v)"    
  echo NPM version: "$(npm -v)"

  echo "Clone Toha theme..."
  git submodule update --init --recursive
  git config core.quotepath false

  echo "Building site..."
  hugo --gc --minify
}

set -euo pipefail
main "$@"
