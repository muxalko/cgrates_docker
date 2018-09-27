FROM scratch
MAINTAINER Michael Klimenko, mklimenko@golantelecom.co.il
ADD /home/golan/proj/bin/cgr-migrator /usr/bin/cgr-migrator
ENTRYPOINT ["/usr/bin/cgr-migrator"]
CMD ["-migrate=*set_versions","-verbose"]