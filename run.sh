#!/bin/sh

echo "done"
pwd
sh deploy-edgeX.sh

cd postman-test/bin
sh run.sh -cd ${1}

cd ..
cd ..

docker-compose down