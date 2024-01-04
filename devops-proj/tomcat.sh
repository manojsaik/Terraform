#!/bin/bash
sudo yum update –y
sudo yum install java -y

JAVA_HOME=$(readlink -f $(which java) | sed "s:bin/java::")
echo "export JAVA_HOME=$JAVA_HOME" | sudo tee -a ~/.bash_profile

cd /opt/
sudo wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.84/bin/apache-tomcat-9.0.84.zip

unzip apache-tomcat-9.0.84.zip

mv apache-tomcat-9.0.84 tomcat

sudo chmod +x tomcat/bin/*.sh

./tomcat/bin/startup.sh








