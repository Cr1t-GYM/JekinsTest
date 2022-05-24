#!/usr/bin/env bash

set -e
echo "p1"
unzip /app/jenkins-${JENKINS_VERSION}.war -d /app/jenkins-${JENKINS_VERSION}
echo "p2"
java -jar /app/bin/jenkins-plugin-manager.jar --war /app/jenkins-${JENKINS_VERSION} --plugin-file "$2" --plugin-download-directory=/usr/share/jenkins/ref/plugins
echo "p3"
/app/bin/jenkinsfile-runner-launcher "$1" -w /app/jenkins-${JENKINS_VERSION} -p /usr/share/jenkins/ref/plugins -f "$3"