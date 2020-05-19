FROM circleci/ruby:2.4.1-node-browsers

# Install apt dependencies
RUN sudo apt-get update && sudo apt-get install awscli libicu-dev python-dev python-pip --fix-missing

# Install jq so circle-ci-do-exclusively will work
RUN mkdir -p ~/bin && curl -L -o ~/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod +x ~/bin/jq

# Install Elastic Beanstalk CLI
RUN python -m pip install awsebcli --upgrade --user

# Install Chromedriver for linux
RUN mkdir -p ~/bin/chromedriver && \
    wget -N http://chromedriver.storage.googleapis.com/83.0.4103.39/chromedriver_linux64.zip -P ~/bin && \
    unzip ~/bin/chromedriver_linux64.zip -d ~/bin/chromedriver && \
    sudo mv -f ~/bin/chromedriver /usr/local/share/ && \
    sudo chmod +x /usr/local/share/chromedriver && \
    sudo rm /usr/local/bin/chromedriver && \
    sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver && \
    sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver

CMD ["/bin/sh"]