FROM debian

ARG BUILD_DATE
ARG BUILD_VERSION

LABEL build_version="${BUILD_VERSION}"
LABEL build_date="${BUILD_DATE}"
LABEL maintainer="kylemharding@gmail.com"

# install updates and common utilities
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && apt-get install -yq --no-install-recommends \
	unbound \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# copy src files
COPY start.sh ./

# run start script on boot
CMD ["/bin/sh", "start.sh"]

