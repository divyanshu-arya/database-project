FROM tomcat:latest
COPY **/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
