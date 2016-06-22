FROM ubuntu:14.04

WORKDIR /

RUN  apt-get update -y \
  && apt-get upgrade -y \
  && apt-get -f install \
  && apt-get install -y \
    wget \
	gconf2 \
	gconf-service \
	libgtk2.0-0 \
	libnotify4 \
	libxtst6 \
	libnss3 \
	python \
	gvfs-bin \
	xdg-utils \
	libgnome-keyring0

RUN  wget --quiet "https://release.gitkraken.com/linux/gitkraken-amd64.deb" -O /gitkraken-amd64.deb \
  && dpkg -i /gitkraken-amd64.deb \
  && rm /gitkraken-amd64.deb

ENV HOME /home/developer
ENV UID 1000
ENV GID 1000

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/bin/gitkraken"]
