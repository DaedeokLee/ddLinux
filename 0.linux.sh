cat >> ~/.bashrc <<_EOF_ 
set -o vi
alias ll='ls -la'
_EOF_
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
JAVA_HOME="/usr/lib/jvm/java-8-oracle"
