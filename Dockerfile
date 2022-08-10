# This is an example script

FROM node:16-bullseye-slim

# Prepare
#REPOSITORY_URL='https://github.com/org/repo'
#git clone $REPOSITORY_URL
#cd repo

WORKDIR /
# Install @techdocs/cli, mkdocs and mkdocs plugins
RUN npm install -g @techdocs/cli
RUN pip install mkdocs-techdocs-core==1.*

# Generate
techdocs-cli generate --no-docker

# Publish
techdocs-cli publish --publisher-type awsS3 --storage-name 'techdocsbucket' --entity 'example-website-techdocs'