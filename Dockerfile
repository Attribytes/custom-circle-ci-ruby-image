FROM circleci/ruby:2.6.6-node-browsers

# Install apt dependencies
# Install jq so circle-ci-do-exclusively will work
# Install Elastic Beanstalk CLI
# Install latest Firefox driver
# Install Chromedriver for linux
RUN sudo apt-get update && sudo apt-get install awscli libicu-dev python-dev python-pip --fix-missing && \
    mkdir -p ~/bin && curl -L -o ~/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod +x ~/bin/jq && \
    python -m pip install awsebcli==3.19.2 pyrsistent==0.16.0 --upgrade --user && \
    /bin/sh -c FIREFOX_URL="https://s3.amazonaws.com/circle-downloads/firefox-mozilla-build_47.0.1-0ubuntu1_amd64.deb" && \
    curl --silent --show-error --location --fail --retry 3 --output /tmp/firefox.deb $FIREFOX_URL && \
    echo 'ef016febe5ec4eaf7d455a34579834bcde7703cb0818c80044f4d148df8473bb  /tmp/firefox.deb' | sha256sum -c && \
    sudo dpkg -i /tmp/firefox.deb || sudo apt-get -f install && \
    sudo apt-get install -y libgtk3.0-cil-dev libasound2 libasound2 libdbus-glib-1-2 libdbus-1-3 && \
    rm -rf /tmp/firefox.deb && \
    firefox --version && \
    /bin/sh -c export CHROMEDRIVER_RELEASE="81.0.4044.138" && \
    curl --silent --show-error --location --fail --retry 3 --output /tmp/chromedriver_linux64.zip "http://chromedriver.storage.googleapis.com/81.0.4044.138/chromedriver_linux64.zip" && \
    cd /tmp && \
    unzip chromedriver_linux64.zip && \
    rm -rf chromedriver_linux64.zip && \
    sudo mv chromedriver /usr/local/bin/chromedriver && \
    sudo chmod +x /usr/local/bin/chromedriver && \
    chromedriver --version

CMD ["/bin/sh"]