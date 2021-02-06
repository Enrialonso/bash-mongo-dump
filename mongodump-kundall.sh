#!/bin/bash -ex
export DUMP_FOLDER=/home/ubuntu/respaldos/
# export DUMP_FOLDER=/home/enrique/Documentos/respaldos/
export FILE_NAME=kundall-backup-$(date +"%m-%d-%y_at_%H-%M")
export DB_NAME=kundall_db
# export DB_NAME=kundall

mongodump --forceTableScan -d ${DB_NAME} -o ${DUMP_FOLDER}${FILE_NAME}

cd ${DUMP_FOLDER}

tar -zcvf ${FILE_NAME}.tar.gz ${FILE_NAME}

aws s3 cp ./${FILE_NAME}.tar.gz s3://respaldos-backup/mongo/${FILE_NAME}.tar.gz

rm -fr ${FILE_NAME}.tar.gz