lsblk
read " "
sudo growpart /dev/xvda 1
read " " 
sudo resize2fs /dev/xvda1 

