# Check if data changed
if [`cat data/version.txt` != `cat /mnt/efs/otp/version.txt`]; then
    # Install Java
    apt-get update; apt-get install -y java-21-amazon-corretto-jdk
    update-alternatives --auto javac
    update-alternatives --auto java

    # Remove existing
    rm -r -f /mnt/efs/*

    # Get graphopper
    wget https://repo1.maven.org/maven2/com/graphhopper/graphhopper-web/9.1/graphhopper-web-9.1.jar 

    # Import data
    java -Xmx10G -D'dw.graphhopper.datareader.file=data/lsc.osm.pbf' -jar graphhopper-web-9.1.jar import config.yml

    # Change permissions
    chmod -R 777 /mnt/efs/otp
    cp data/version.txt /mnt/efs/otp/version.txt
fi

echo "Import completed successfully"