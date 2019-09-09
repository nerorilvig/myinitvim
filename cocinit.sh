#!/bin/bash
#すでにcocに関する記述がdein.tomlに埋め込まれている前提
#ansibleでファイルチェックしてからyarnやnodeのインストールを実行させること
curl -sL install-node.now.sh/lts | bash
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
vim +'call dein#update()' +:q
cd ~/.cache/dein/repos/github.com/neoclide/coc.nvim
git clean -xfd
yarn install --frozen-lockfile
