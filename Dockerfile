FROM amazoncorretto:17-alpine-jdk

# Set environment variables
ENV OTP_BASE /var/otp
ENV OTP_GRAPHS $OTP_BASE/graphs


# Copy OTP data
ADD data/graphs $OTP_GRAPHS/

RUN apk update && apk add bash
RUN set -x && \
    apk add --no-cache ca-certificates openssl && \
    mkdir -p $OTP_BASE/scripting $OTP_GRAPHS/lsc

# Download dependencies
RUN   wget -P $OTP_GRAPHS/lsc https://download.geofabrik.de/europe/great-britain/england/lancashire-latest.osm.pbf
RUN   wget -P $OTP_GRAPHS/lsc https://download.geofabrik.de/europe/great-britain/england/cumbria-latest.osm.pbf
RUN   wget -O $OTP_BASE/otp.jar https://repo1.maven.org/maven2/org/opentripplanner/otp/2.4.0/otp-2.4.0-shaded.jar
RUN   wget -O $OTP_BASE/jython.jar http://search.maven.org/remotecontent?filepath=org/python/jython-standalone/2.7.3/jython-standalone-2.7.3.jar
RUN   java -Xmx8G -jar /var/otp/otp.jar --build --save /var/otp/graphs/lsc 

EXPOSE 8080
EXPOSE 8081

CMD ["java", "-Xmx8G", "-cp", "/var/otp/otp.jar:/var/otp/jython.jar", "org.opentripplanner.standalone.OTPMain", "--load", "/var/otp/graphs/lsc"]