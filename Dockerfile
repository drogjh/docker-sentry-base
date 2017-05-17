FROM sentry:8.15-onbuild

# Install env
RUN apt-get update && apt-get install -y \
        libmysqlclient-dev \
        libmysqld-dev \
        && rm -r /var/lib/apt/lists/*

# Install python soft
RUN pip install MySQL-python \
 supervisor

# copy supervisords
COPY supervisords/ /etc/supervisords


# some cleanup
RUN apt-get clean