ARG BASE_IMAGE=gcr.io/${PROJECT_ID}/npm:node-6.14.4
FROM ${BASE_IMAGE}

#ARG JFROG_CLI_VERSION=1.17.1
ARG JFROG_CLI_VERSION=v2
ARG USER_HOME_DIR="/app"

# PR submitted to download versioned JFrog CLI
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list

# As suggested by a user, for some people this line works instead of the first one. Use whichever works for your case
# RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list


RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list

RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN  apt-get install -qqy curl \
  && cd /tmp \
  && curl -fL https://getcli.jfrog.io/v2 | sh \
  && mv jfrog /usr/bin/ \
  && apt-get remove -qqy --purge curl \
  && rm /var/lib/apt/lists/*_*

ENTRYPOINT ["jfrog"]