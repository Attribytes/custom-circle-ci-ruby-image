# custom-circle-ci-ruby-image

This docker image is based on circleci/ruby:2.4.1-node-browsers, and includes a number of extra layers:

1. AWS CLI
2. Python and Python dev dependencies
3. jq (for circle-ci-do-exclusively)
4. Elastic Beanstalk CLI

## Building the Docker Image
Simply check out the repo and run:
```
docker build .
```

## Automatic Builds
Any time changes are committed to this git repo, the public docker image will be automatically built on Docker hub.

The docker hub path for this repo is:
https://cloud.docker.com/u/attribytes/repository/docker/attribytes/custom-circle-ci-ruby-image