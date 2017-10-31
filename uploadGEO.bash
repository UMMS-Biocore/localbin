#!/bin/bash

file=$1

local_dir=/project/umw_garberlab/human/EBOV/KKWD_July2016/process
remote_dir=/fasp/alper/

a=$(ps -ef|grep "$file")
echo ${a}

if [[ "${a}" == *ncftp* ]];
then
   echo "HERE1"
else
   echo "HERE"
   ncftpput -z -u geo -p 33%9uyj_fCh?M16H ftp-private.ncbi.nlm.nih.gov $remote_dir $local_dir/$file
fi
