#!/bin/bash

ansible-playbook -i "localhost," -c local /docker-entrypoint.yml \
  --extra-vars "cacti_version=$CACTI_VERSION cacti_db=$CACTI_DB \
  cacti_db_host=$CACTI_DB_HOST cacti_db_user=$CACTI_DB_USER \
  cacti_db_password=$CACTI_DB_PASSWORD cacti_user=$CACTI_USER \
  cacti_user_password=$CACTI_USER_PASSWORD"

apache2ctl -D FOREGROUND
