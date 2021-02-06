#!/bin/bash -ex
export DUMP_FOLDER=/home/ubuntu/respaldos/
export FILE_NAME=kundall-backup-$(date +"%m-%d-%y_at_%H-%M")
export DB_NAME=kundall_db

mongodump --forceTableScan -d ${DB_NAME} -o ${DUMP_FOLDER}${FILE_NAME}

cd ${DUMP_FOLDER}

tar -zcvf ${FILE_NAME}.tar.gz .

aws s3 cp ${FILE_NAME}.tar.gz s3://kundall-backup/mongo/${FILE_NAME}.tar.gz

rm -fr ${DUMP_FOLDER}${FILE_NAME}