FROM amazoncorretto:17-alpine-jdk

# Add files
WORKDIR /var/otp
ADD data data/
RUN wget https://download.bbbike.org/osm/extract/planet_-2.981_53.017_95513bad.osm.pbf -O data/lsc.osm.pbf

# Download/ move data
ADD config.yml ./
RUN wget https://repo1.maven.org/maven2/com/graphhopper/graphhopper-web/9.1/graphhopper-web-9.1.jar 
# RUN java -Xmx10G -D'dw.graphhopper.datareader.file=/var/otp/data/lsc.osm.pbf' -jar /var/otp/graphhopper-web-9.1.jar import config.yml

EXPOSE 8080

CMD ["java", "-Xmx10G", "-D'dw.graphhopper.datareader.file=/var/otp/data/lsc.osm.pbf'", "-jar", "/var/otp/graphhopper-web-9.1.jar", "server", "config.yml"]