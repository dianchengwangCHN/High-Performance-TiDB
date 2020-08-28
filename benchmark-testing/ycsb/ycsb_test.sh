#!/bin/bash

tests=(a b c d e f)
test_out=./ycsb_test_out
dir=../go-ycsb/
bin=bin/go-ycsb

for t in ${tests[@]}
do
  echo -e "\n######\nworkload${t}\n######\n" >> ${test_out}
  ${dir}/${bin} load mysql -P ${dir}/workloads/workload${t} -p recordcount=500000 -p mysql.host=172.31.58.100 -p mysql.port=4000 --threads 128 >> ${test_out}
  ${dir}/${bin} run mysql -P ${dir}/workloads/workload${t} -p recordcount=500000 -p mysql.host=172.31.58.100 -p mysql.port=4000 --threads 128 >> ${test_out}
done
