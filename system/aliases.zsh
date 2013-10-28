# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
alias ls="ls -F --color"
alias l="ls -lAh --color"
alias ll="ls -al --color"
alias la='ls -A --color'

# http://whereswalden.com/2009/10/23/pbcopy-and-pbpaste-for-linux/
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
