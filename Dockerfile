FROM alpine
MAINTAINER Matias Vidal <m@m01.cl>

ENV VERSION master

# Install requirements
RUN apk add --update-cache \
        git \
        zlib \
        gnupg1 \
        py2-pip \
        openssl \
        py-jinja2 \
        py-libxml2 \
        py-libxslt \
        py-lxml \
        py-pbr \
        py-pillow \
        py-cffi \
        py-cryptography \
        ca-certificates

# Get Mailpile from github
RUN git clone https://github.com/mailpile/Mailpile.git \
        --branch $VERSION --single-branch --recursive

WORKDIR /Mailpile

# Install missing requirements
RUN pip install -r requirements.txt

# Initial Mailpile setup
RUN ./mp setup

CMD ./mp --www=0.0.0.0:33411 --wait
EXPOSE 33411

VOLUME /root/.local/share/Mailpile
VOLUME /root/.gnupg
