user=$1
clusteruser=$2
echo $user
lab="ldapsearch -H ldap://edunivad06.ad.umassmed.edu -x -D 'cn=SVCLinuxLDAPAuth,ou=Service Accounts,ou=Accounts,dc=ad,dc=umassmed,dc=edu' -b 'ou=Accounts,dc=ad,dc=umassmed,dc=edu' -w 'Umass2008' -LLL '(sAMAccountName=${user})'|grep lab|awk '{split(\$2, a,\",\");split(a[1],b,\"=\");print b[2]}'|head -n 1|sed 's/_nas03//'"
lab=`eval $lab`

name="ldapsearch -H ldap://edunivad06.ad.umassmed.edu -x -D 'cn=SVCLinuxLDAPAuth,ou=Service Accounts,ou=Accounts,dc=ad,dc=umassmed,dc=edu' -b 'ou=Accounts,dc=ad,dc=umassmed,dc=edu' -w 'Umass2008' -LLL '(sAMAccountName=${user})'|grep \"^name\"|awk '{split(\$0,b,\":\");print b[2]}' |head -n 1|sed 's/^ *//' | sed 's/ *\$//'"
name=`eval $name`

email="ldapsearch -H ldap://edunivad06.ad.umassmed.edu -x -D 'cn=SVCLinuxLDAPAuth,ou=Service Accounts,ou=Accounts,dc=ad,dc=umassmed,dc=edu' -b 'ou=Accounts,dc=ad,dc=umassmed,dc=edu' -w 'Umass2008' -LLL '(sAMAccountName=${user})'|grep \"^mail:\"|awk '{split(\$0,b,\":\");print b[2]}'|tail -n 1|sed 's/^ *//' | sed 's/ *\$//'"
email=`eval $email`

group=$lab

echo "insert into users(username, clusteruser, role, group, name, email, institute, lab) values ('${user}','${clusteruser}','user','${group}','${name}','${email}','UMassMed','${lab}')"

