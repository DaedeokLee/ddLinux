function myssh() {
echo -e "~/.ssh-nodes-ip";
cat ~/ssh-nodes-ip;
echo -e "select node #" ;
read NODE;
grep $NODE ~/ssh-nodes-ip |awk -F ":" '{print "ssh -i ~/aws-key ubuntu@"$2}'  > ~/.ssh_commands.tmp;
sh ~/.ssh_commands.tmp;
}
