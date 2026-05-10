1  # Use a base image that supports systemd, for example, Ubuntu
2  FROM ubuntu:20.04
3  
4  # Install necessary packages
5  RUN apt-get update && \
6  apt-get install -y shellinabox && \
7  apt-get install -y systemd && \
8  apt-get clean && \
9  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
10 RUN echo 'root:root' | chpasswd
11 # Expose the web-based terminal port
12 EXPOSE 4200
13 
14 # Start shellinabox
15 CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
