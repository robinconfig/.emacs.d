#!/bin/sh

go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest

brew install ripgrep
brew install shellcheck
npm i -g bash-language-server

# install program: ag
# homepage: https://github.com/ggreer/the_silver_searcher
brew install the_silver_searcher
