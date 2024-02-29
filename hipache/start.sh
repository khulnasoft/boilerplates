#!/usr/bin/env bash
#===============================================================================
#
#    AUTHOR: Khulnasoft DevOps <info@khulnasoft.com>
#
#===============================================================================
echo "Waiting for redis:"
./tcp_wait.sh $REDIS_PORT_6379_TCP_ADDR $REDIS_PORT_6379_TCP_PORT
#-------------------------------------------------------------------------------
sed -e "s/localhost/$REDIS_PORT_6379_TCP_ADDR/g" -i config.json
#-------------------------------------------------------------------------------
echo "Starting hipache:"
exec /usr/bin/hipache -c config.json
#===============================================================================
