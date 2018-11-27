#/bin/bash
RSK_NETWROK="testnet" ## mainnet | testnet | regtest
RSK_RPC_IP="localhost"
RSK_RPC_PORT="4444"


sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
JAVA_HOME="/usr/lib/jvm/java-8-oracle"

sudo add-apt-repository ppa:rsksmart/rskj
sudo apt-get update
sudo apt-get install rskj

sudo npm install -g truffle

touch ~/truffle.js
cat >> ~/truffle.js <<_EOF_
module.exports = {
  networks: {
    rsk: {
      host: "${RSK_RPC_IP}"
      port: "${RSK_RPC_PORT}",
      network_id: "*" // Match any network id
    }
  }
};
_EOF_
sed -i s/localhost/${RSK_RPC_IP}/g sample.conf
sed -i s/4444/${RSK_RPC_PORT}/g sample.conf
sudo cp sample.conf /etc/rsk/node.conf

alias rsk-start='sudo service rsk start'
alias rsk-restart='sudo service rsk restart'
alias rsk-status='sudo service rsk status'
alias rsk-stop='sudo service rsk stop'
alias rsk-console='cd ~ && truffle console --network rsk'

echo "--alias list --"
alias |grep rsk-


# lower web3 version  console 
#mkdir ~/rsk-utils
#cd ~/rsk-utils
#wget https://github.com/rsksmart/utilities/archive/master.zip
#sudo apt-get install unzip
#unzip master.zip
#cd utilities-master/console
#npm install
#cd ~
#alias rsk-console='node ~/rsk-utils/utilities-master/console/console.js'

