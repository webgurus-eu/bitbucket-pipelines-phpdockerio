FROM webguruseu/bitbucket-pipelines-phpdockerio:php82

RUN curl -fsSL https://bun.sh/install | bash; \
    source /root/.bashrc;
