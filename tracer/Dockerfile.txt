FROM debian:latest
MAINTAINER Michael Klimenko, mklimenko@golantelecom.co.il 
RUN apt-get update && apt-get install -y tcpdump
CMD tcpdump -i eth0