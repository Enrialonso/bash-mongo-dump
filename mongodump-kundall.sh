#!/bin/bash -ex
export DUMP_FOLDER=/home/ubuntu/respaldos/
export FILE_NAME=kundall-backup-$(date +"%m-%d-%y_at_%H-%M")
export DB_NAME=kundall_db

mongodump --forceTableScan -d ${DB_NAME} -o ${DUMP_FOLDER}${FILE_NAME}

aws s3 cp ${DUMP_FOLDER} s3://kundall-backup/mongo/ --recursive

rm -fr ${DUMP_FOLDER}${FILE_NAME}