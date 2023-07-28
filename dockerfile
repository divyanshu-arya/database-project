FROM tomcat:latest
COPY **/*.war /usr/local/tomcat/webapps/
CMD ["startup.sh", "run"]
