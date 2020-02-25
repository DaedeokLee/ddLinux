read -p "container_name :" CONTAINER_NAME
read -p "volume directory :" MY_HOME
read -p "db name :" SCHEMA
read -p "user name :" USER
read -p "port forwarding :" PORT
read -p "server-id :" SERVER_ID
cat > docker-compose.yml <<_EOF_
version: '3.7'
services:
  ${CONTAINER_NAME}:
    container_name: ${CONTAINER_NAME}
    image: mysql:8.0
    restart: always
    volumes:
      - ${MY_HOME}/data:/var/lib/mysql
      - ${MY_HOME}/conf.d:/etc/mysql/mysql.conf.d/
      - ${MY_HOME}/log:/var/log/mysql
      - ${MY_HOME}/backup:/backup
    ports:
      - ${PORT}:3306
    environment:
      MYSQL_DATABASE: $SCHEMA
      MYSQL_USER: $USER
      MYSQL_PASSWORD: "oracle"
      MYSQL_ROOT_PASSWORD: "oracle"
_EOF_
mkdir -p ${MY_HOME}/conf.d
touch ${MY_HOME}/conf.d/mysqld.cnf
cat >> ${MY_HOME}/conf.d/mysqld.cnf <<_EOF_
[mysqld]
log-bin=mysql-bin
server-id=${SERVER_ID}
_EOF_