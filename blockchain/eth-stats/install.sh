WS_SERVER="http://webserver:3000"
WS_SECRET="oracle"
cd ~
git clone https://github.com/cubedro/eth-net-intelligence-api
cd eth-net-intelligence-api
npm install
sudo -S npm install -g pm2

cat  > app.json <_EOF_
[
  {
    "name"              : "RSK-TEST",
    "script"            : "app.js",
    "log_date_format"   : "YYYY-MM-DD HH:mm Z",
    "merge_logs"        : false,
    "watch"             : false,
    "max_restarts"      : 10,
    "exec_interpreter"  : "node",
    "exec_mode"         : "fork_mode",
    "env":
    {
      "NODE_ENV"        : "RSK-TEST",
      "RPC_HOST"        : "13.124.0.80",
      "RPC_PORT"        : "8545",
      "LISTENING_PORT"  : "50505",
      "INSTANCE_NAME"   : "RSK-TEST",
      "CONTACT_DETAILS" : "",
      "WS_SERVER"       : "$WS_SERVER",
      "WS_SECRET"       : "$WS_SECRET",
      "VERBOSITY"       : 2
    }
  },
  {
    "name"              : "RSK-NODE-0",
    "script"            : "app.js",
    "log_date_format"   : "YYYY-MM-DD HH:mm Z",
    "merge_logs"        : false,
    "watch"             : false,
    "max_restarts"      : 10,
    "exec_interpreter"  : "node",
    "exec_mode"         : "fork_mode",
    "env":
    {
      "NODE_ENV"        : "RSK-NODE-0",
      "RPC_HOST"        : "13.209.74.86",
      "RPC_PORT"        : "8545",
      "LISTENING_PORT"  : "50505",
      "INSTANCE_NAME"   : "RSK-NODE-0",
      "CONTACT_DETAILS" : "",
      "WS_SERVER"       : "$WS_SERVER",
      "WS_SECRET"       : "$WS_SECRET",
      "VERBOSITY"       : 2
    }
  },

  {
    "name"              : "RSK-NODE-1",
    "script"            : "app.js",
    "log_date_format"   : "YYYY-MM-DD HH:mm Z",
    "merge_logs"        : false,
    "watch"             : false,
    "max_restarts"      : 10,
    "exec_interpreter"  : "node",
    "exec_mode"         : "fork_mode",
    "env":
    {
      "NODE_ENV"        : "RSK-NODE-1",
      "RPC_HOST"        : "13.124.224.191",
      "RPC_PORT"        : "8040",
      "LISTENING_PORT"  : "50505",
      "INSTANCE_NAME"   : "RSK-NODE-1",
      "CONTACT_DETAILS" : "",
      "WS_SERVER"       : "$WS_SERVER",
      "WS_SECRET"       : "$WS_SECRET",
      "VERBOSITY"       : 2
    }
  }


]
_EOF_
