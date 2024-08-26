FROM webguruseu/bitbucket-pipelines-phpdockerio:php82

RUN curl -fsSL https://bun.sh/install | bash; \
    export BUN_INSTALL="$HOME/.bun"; \
    export PATH="$BUN_INSTALL/bin:$PATH";
