#!/usr/bin/env bash

main() {
  Hugo_VERSION="0.148.1"
  DART_SASS_VERSION="1.89.2"

  export TZ="Europe/Berlin"

  # Install Dart Sass
  echo "Installing Dart Sass v${DART_SASS_VERSION}..."
  curl -LJO "https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz"
  tar -xf "dart-sass-${DART_SASS_VERSION}-linux-x64.tar.gz"
  cp -r dart-sass/ /opt/buildhome
  rm -rf dart-sass*

  # Install Hugo
  echo "Installing Hugo v${HUGO_VERSION}..."
  curl -LJO https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz
  tar -xf "hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz"
  cp hugo /opt/buildhome
  rm LICENSE README.md hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz


  # Set PATH
  echo "Setting the PATH environment variable..."
  export PATH=/opt/buildhome:/opt/buildhome/dart-sass:$PATH

  echo "Hugo version $Hugo_VERSION installed successfully."
  echo Dart Sass: "$(sass --version)"
  echo Go: "${go version}"
  echo "Hugo version: $(hugo version)"
  echo Node.js version: "$(node -v)"    
  echo NPM version: "$(npm -v)"

  # https://gohugo.io/methods/page/gitinfo/#hosting-considerations
  git fetch --recurse-submodules --unshallow

  git config core.quotepath false

  echo "Building site..."
  hugo --gc --minify
}

set -euo pipefail
main "$@"
