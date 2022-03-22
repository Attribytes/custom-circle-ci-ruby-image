FROM cimg/ruby:2.6.8-browsers

# Install apt dependencies
# Install jq so circle-ci-do-exclusively will work
# Install Elastic Beanstalk CLI
# Install latest Firefox driver
# Install Chromedriver for linux
RUN sudo apt-get update && sudo apt-get install awscli libicu-dev python-dev --fix-missing && curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py && python get-pip.py


# install pereqs for googledriver, libicu, imagemagic
RUN sudo apt-get install build-essential zlib1g-dev libssl-dev libncurses-dev libffi-dev libsqlite3-dev libreadline-dev libbz2-dev libicu-dev imagemagick

# intall python 3 and awsebcli
RUN sudo apt-get install -qq -y python3-setuptools && curl https://bootstrap.pypa.io/pip/3.5/get-pip.py | python3
RUN sudo apt-get -qq -y install python3-venv && pip install pipx
RUN pipx install awsebcli

# install awscli
RUN sudo apt-get install awscli

RUN curl -sL https://sentry.io/get-cli/ | bash

CMD ["/bin/sh"]
