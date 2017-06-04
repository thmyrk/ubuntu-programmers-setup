#!/bin/bash

mavenVersion="$(curl -s https://www-us.apache.org/dist/maven/maven-3/ | sed -E -ne '/href=/x; $ { x; s,^.*href="([0-9\.]+)/".*$,\1,; p };' )"

mkdir -p ~/opt
cd ~/opt

if ! [[ -d "apache-maven-$mavenVersion" ]]; then
	curl "https://www-us.apache.org/dist/maven/maven-3/$mavenVersion/binaries/apache-maven-$mavenVersion-bin.tar.gz" | gunzip | tar -x
fi

ln -sf "apache-maven-$mavenVersion" maven

