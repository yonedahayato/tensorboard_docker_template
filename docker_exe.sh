#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker build -t tensorboard -f ./dockerfile/Dockerfile_tb .
docker build -t tb_sample -f ./dockerfile/Dockerfile_example .

if [ ! -d "tensorboard_log" ]; then
  mkdir tensorboard_log
fi

#docker run --rm -it -v $SCRIPT_DIR/tensorboard_log:/code/tensorboard_log -p 6006:6006 tb_sample /bin/bash
WORKING_DIR=$SCRIPT_DIR
LOG_DIR=$SCRIPT_DIR/tensorboard_log

export WORKING_DIR=$WORKING_DIR
export LOG_DIR=$LOG_DIR

echo "working_dir: " ${WORKING_DIR}
echo "log_dir: " ${LOG_DIR}

# env WORKING_DIR=$SCRIPT_DIR LOG_DIR=$SCRIPT_DIR/tensorboard_log docker-compose up -d
docker-compose up
