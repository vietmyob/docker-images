FROM node:6.9.1

RUN apt-get update && apt-get install Xvfb unzip -y

##### Chrome Driver Installation #####
RUN tempfile=$(mktemp) && \
    version=$(wget -q -O - http://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -O ${tempfile} http://chromedriver.storage.googleapis.com/${version}/chromedriver_linux64.zip && \
    unzip ${tempfile} -d /usr/local/bin && \
    chmod 755 /usr/local/bin/chromedriver

##### Chrome Browser Installation #####
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    #Adds the repository to the apt source list
    bash -c "echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list" && \
    #Refreshes the list
    apt-get update && \
    #Installs chrome like a boss
    apt-get install -y --allow-unauthenticated google-chrome-stable

ENV DISPLAY=:99

CMD /bin/bash
