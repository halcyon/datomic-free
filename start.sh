#!/usr/bin/env bash

sed -i "s/^host=localhost/host=0.0.0.0/" transactor.properties
sed -i "/^host=0.0.0.0/a alt-host=${ALT_HOST:-127.0.0.1}" transactor.properties
sed -i "s/^# storage-admin-password=/storage-admin-password=${ADMIN_PASSWORD}/" transactor.properties
sed -i "s/^# storage-datomic-password=/storage-datomic-password=${DATOMIC_PASSWORD}/" transactor.properties
sed -i "s/^# storage-access=local/storage-access=remote/" transactor.properties

bin/transactor transactor.properties
