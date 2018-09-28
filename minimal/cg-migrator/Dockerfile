FROM scratch
MAINTAINER Michael Klimenko, mklimenko@golantelecom.co.il
COPY /bin/cgr-migrator /usr/bin/cgr-migrator
ENTRYPOINT ["/usr/bin/cgr-migrator"]
CMD ["-migrate=*set_versions","-verbose"]