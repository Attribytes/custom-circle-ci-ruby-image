FROM circleci/ruby:2.4.1-node-browsers

# Install apt dependencies
RUN sudo apt-get update && sudo apt-get install awscli libicu-dev python-dev python-pip --fix-missing

# Install jq so circle-ci-do-exclusively will work
RUN mkdir -p ~/bin && curl -L -o ~/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod +x ~/bin/jq

# Install Elastic Beanstalk CLI
RUN python -m pip install awsebcli --upgrade --user

CMD ["/bin/sh"]