FROM debian:stable-slim

LABEL org.opencontainers.image.source=https://github.com/uridium/docker-latex
LABEL org.opencontainers.image.description="A minimal Docker image for LaTeX based on Debian Stable Slim"
LABEL org.opencontainers.image.licenses=MIT

ENV DEBIAN_FRONTEND=noninteractive
ARG UID=1000 GID=1000

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends \
        texlive \
        texlive-base \
        texlive-font-utils \
        texlive-fonts-extra \
        texlive-fonts-recommended \
        texlive-lang-english \
        texlive-latex-base \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-luatex \
        texlive-xetex \
        fonts-adobe-sourcesans3 \
        fonts-font-awesome \
        make \
    && apt-get purge -y -qq "^tex.*-doc$" \
    && apt-get clean \
    && find /usr/share/doc -type f -not -name 'copyright' -delete \
    && find /usr/share/man -type f -delete \
    && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN groupadd -g $UID latex && useradd -m -u $UID -g latex latex
USER latex
