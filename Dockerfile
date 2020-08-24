	
## MySQL 5.7 with Percona Xtrabackup
 
## Pull the mysql:5.7 image
FROM mysql:5.7
 
## The maintainer name and email
MAINTAINER Marel Moras <marel.moras@gmail.com>
 
## List all packages that we want to install
ENV PACKAGE percona-xtrabackup-24
 
# Install requirement (wget)
RUN apt-get update && apt-get install -y wget && apt-get install -y lsb-release && apt install curl -y && apt clean all
 
# Install Percona apt repository and Percona Xtrabackup
RUN wget https://repo.percona.com/apt/percona-release_latest.buster_all.deb  && \
    dpkg -i percona-release_latest.buster_all.deb  && \
    apt-get update && \
    apt-get install -y $PACKAGE
 
# Create the backup destination
RUN mkdir -p /backup/xtrabackups
 
# Allow mountable backup path
VOLUME ["/backup/xtrabackup"]
