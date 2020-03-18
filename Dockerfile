FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive

ARG UID=1000
ARG GID=1000

RUN apt-get update -qq \
    && apt-get dist-upgrade -y -qq \
    && apt-get install -y --no-install-recommends \
        fonts-font-awesome \
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
    && apt-get purge -y -qq ^tex.*-doc$ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN groupadd -g $UID latex \
    && useradd -m -u $UID -g latex latex

USER latex

WORKDIR /docs

ENTRYPOINT ["xelatex"]

CMD ["--help"]
