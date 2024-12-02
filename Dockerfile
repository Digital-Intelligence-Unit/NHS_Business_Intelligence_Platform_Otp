FROM amazoncorretto:17-alpine-jdk

# Add files
WORKDIR /var/otp
ADD data data/
RUN wget https://lscics-sis-infra-publicfiles-ew2-dev.s3.eu-west-2.amazonaws.com/misc/lsc.osm.pbf -O data/lsc.osm.pbf

# Copy files
ADD config.yml ./
ADD scripts/run.sh ./scripts/run.sh
RUN chmod +x ./scripts/run.sh

# Download jar
RUN wget https://repo1.maven.org/maven2/com/graphhopper/graphhopper-web/9.1/graphhopper-web-9.1.jar 

EXPOSE 8080

CMD ["sh", "./scripts/run.sh"]