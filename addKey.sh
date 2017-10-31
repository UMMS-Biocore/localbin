#!/bin/bash
username=$1;
host=$2;
cat ~/.ssh/id_rsa.pub|ssh $username"@"$host "cat - >> ~/.ssh/authorized_keys";
