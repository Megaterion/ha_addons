#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

export MODE_tmp=$(jq --raw-output '.mode // empty' $CONFIG_PATH)

export AUTO_RECEIVE_SCHEDULE_bool=$(jq --raw-output '.AUTO_RECEIVE // empty' $CONFIG_PATH)

export SIGNAL_CLI_CMD_TIMEOUT_tmp=$(jq --raw-output '.SIGNAL_CLI_CMD_TIMEOUT // empty' $CONFIG_PATH)

export MODE=$(jq --raw-output '.mode // empty' $CONFIG_PATH)

if [ "${MODE_tmp}" != "json-rpc" ]; then

	if [ $AUTO_RECEIVE_SCHEDULE_bool ]
	then
	  export AUTO_RECEIVE_SCHEDULE='0 22 * * *'
	fi

	if [ $SIGNAL_CLI_CMD_TIMEOUT_tmp -ne 0 ]
	then
	  export SIGNAL_CLI_CMD_TIMEOUT=$(jq --raw-output '.SIGNAL_CLI_CMD_TIMEOUT // empty' $CONFIG_PATH)
	fi

fi

sh /entrypoint.sh
