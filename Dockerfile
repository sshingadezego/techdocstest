# This is an example script

FROM node:16-bullseye-slim

# Prepare
#REPOSITORY_URL='https://github.com/org/repo'
#git clone $REPOSITORY_URL
#cd repo

WORKDIR /docs

RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install mkdocs-techdocs-core==1.0.1
# Install @techdocs/cli, mkdocs and mkdocs plugins
RUN npm install -g @techdocs/cli
RUN pip install mkdocs-techdocs-core==1.*


# Generate
RUN echo packages/techdocs-cli/bin/techdocs-cli generate --no-docker

# Publish
RUN echo packages/techdocs-cli/bin/techdocs-cli publish --publisher-type awsS3 --storage-name 'techdocsbucket' --entity 'example-website-techdocs'