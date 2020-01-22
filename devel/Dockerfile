FROM debian:latest

# set mysql version and root password
RUN echo 'mysql-community-server mysql-community-server/root-pass password CGRateS.org' | debconf-set-selections \
 && echo 'mysql-community-server mysql-community-server/re-root-pass password CGRateS.org' | debconf-set-selections \
 && echo 'mysql-apt-config mysql-apt-config/select-server select mysql-8.0' | debconf-set-selections \
 && echo 'mysql-apt-config mysql-apt-config/select-repo select mysql-8.0' | debconf-set-selections \
 && echo 'mysql-apt-config mysql-apt-config/select-product select Apply' | debconf-set-selections

# install dependencies
RUN apt-get -y update && apt-get -y install git vim rsyslog ngrep curl wget lsb-release gnupg dirmngr tzdata

# Preparation for mysql-server install
#RUN wget http://repo.mysql.com/mysql-apt-config_0.8.14-1_all.deb
#RUN dpkg -i mysql-apt-config_0.8.14-1_all.deb
RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 5072E1F5
RUN echo "deb http://repo.mysql.com/apt/debian $(lsb_release -sc) mysql-8.0" | tee /etc/apt/sources.list.d/mysql80.list && apt-get -y update

#RUN apt-get -y update # && apt-cache search mysql-server mariadb-server mysql-community-server

# install mysql-server 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install redis-server mysql-server python-pycurl python-mysqldb

# add cgrates user
RUN useradd -c CGRateS -d /var/run/cgrates -s /bin/false -r cgrates

# install golang
#RUN wget -qO- https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz | tar xzf - -C /root/
#RUN wget -qO- https://storage.googleapis.com/golang/go1.11.linux-amd64.tar.gz | tar xzf - -C /root/
RUN wget -qO- https://storage.googleapis.com/golang/go1.13.5.linux-amd64.tar.gz | tar xzf - -C /root/

#install glide
RUN GOROOT=/root/go GOPATH=/root/code /root/go/bin/go get github.com/Masterminds/glide

# skip caching
COPY marker /dev/null

# get cgrates from github
RUN mkdir -p /root/code/src/github.com/cgrates; cd /root/code/src/github.com/cgrates; git clone https://github.com/cgrates/cgrates.git

# get cgrates configs + tariffplans from gitlab
#RUN mkdir -p /root/code/src/gitlab-ptk.gt.local/Configs; cd /root/code/src/gitlab-ptk.gt.local/Configs; git clone git@10.224.228.190:Configs/CGRates.git
#RUN mkdir -p /root/code/src/gitlab-ptk.gt.local/Configs; cd /root/code/src/gitlab-ptk.gt.local/Configs; git clone git@gitlab-ptk.gt.local:Configs/CGRates.git

# create link to cgrates dir
RUN ln -s /root/code/src/github.com/cgrates/cgrates /root/cgr

# checkout to specific commit
#RUN cd /root/cgr; git checkout 82ddc85

# Start a new workspace and create glide.yaml
#RUN cd /root/cgr; GOROOT=/root/go GOPATH=/root/code PATH=$GOROOT/bin:$GOPATH/bin:$PATH glide create --non-interactive
#RUN cd /root/cgr; GOROOT=/root/go GOPATH=/root/code PATH=$GOROOT/bin:$GOPATH/bin:$PATH glide init --non-interactive

# generate ssh keys
#RUN ssh-keygen -q -t rsa -N '' -f '/root/.ssh/id_rsa'

# get go deps
#RUN cd /root/cgr; GOROOT=/root/go GOPATH=/root/code PATH=$GOROOT/bin:$GOPATH/bin:$PATH glide up 
#RUN cd /root/cgr; GOROOT=/root/go GOPATH=/root/code PATH=$GOROOT/bin:$GOPATH/bin:$PATH glide install 

# build cgrates
RUN cd /root/cgr; GOROOT=/root/go GOPATH=/root/code PATH=$GOROOT/bin:$GOPATH/bin:$PATH ./build.sh

#Build static binaries
COPY build_static_go.sh /root/code/src/github.com/cgrates/cgrates/build_static_go.sh
RUN mkdir $GOROOT/bin/static; cd /root/code/src/github.com/cgrates/cgrates; GOROOT=/root/go GOPATH=/root/code PATH=$GOROOT/bin:$GOPATH/bin:$PATH ./build_static_go.sh

# create links
RUN ln -s /root/code/bin/cgr-engine /usr/bin/
RUN ln -s /root/code/bin/cgr-loader /usr/bin/
RUN ln -s /root/code/bin/cgr-console /usr/bin/
RUN ln -s /root/code/bin/cgr-migrator /usr/bin/
RUN ln -s /root/code/bin/cgr-tester /usr/bin/
RUN ln -s /root/code/src/github.com/cgrates/cgrates/data /usr/share/cgrates
#RUN ln -s /root/code/src/gitlab-ptk.gt.local/Configs/CGRates/CSV_Assets/tariff_golan_basic /usr/share/cgrates/golantp

#install oh-my-zsh
#RUN TERM=xterm sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"; exit 0

# change shell for tmux
#RUN chsh -s /usr/bin/zsh

# prepare zshrc
#RUN echo 'export GOROOT=/root/go; export GOPATH=/root/code; export PATH=$GOROOT/bin:$GOPATH/bin:$PATH'>>/root/.zshrc

# cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#Show go version installed 
RUN GOROOT=/root/go GOPATH=/root/code /root/go/bin/go version

#Copy start.sh 
COPY ./start.sh /root

#Show start.sh
RUN cat /root/start.sh

# set start command
CMD /root/start.sh
