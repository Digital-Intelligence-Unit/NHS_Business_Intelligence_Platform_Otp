FROM openjdk:8-jre-alpine

ENV OTP_BASE /var/otp
ENV OTP_GRAPHS $OTP_BASE/graphs

WORKDIR /Data

COPY . $OTP_GRAPHS/lsc/

RUN apk update && apk add bash
RUN set -x && \
    apk add --no-cache ca-certificates openssl && \
    mkdir -p $OTP_BASE/scripting $OTP_GRAPHS/lsc
RUN   wget -P $OTP_GRAPHS/lsc https://download.geofabrik.de/europe/great-britain/england/lancashire-latest.osm.pbf
RUN   wget -P $OTP_GRAPHS/lsc https://download.geofabrik.de/europe/great-britain/england/cumbria-latest.osm.pbf
RUN   wget -O $OTP_BASE/otp.jar https://repo1.maven.org/maven2/org/opentripplanner/otp/1.2.0/otp-1.2.0-shaded.jar
RUN   wget -O $OTP_BASE/jython.jar http://search.maven.org/remotecontent?filepath=org/python/jython-standalone/2.7.0/jython-standalone-2.7.0.jar
RUN   java -Xmx2G -jar /var/otp/otp.jar --build /var/otp/graphs/lsc

EXPOSE 8080
EXPOSE 8081

CMD ["java", "-Xmx2G", "-Xverify:none", "-cp", "/var/otp/otp.jar:/var/otp/jython.jar", "org.opentripplanner.standalone.OTPMain", "--router", "lsc", "--server"]

# CMD ["--help"]
