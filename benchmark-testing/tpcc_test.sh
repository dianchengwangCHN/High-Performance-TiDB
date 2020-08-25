#!/bin/bash

host=172.31.58.100
port=4000
test_out=./tpcc_test_out
for num in 500 128 32 8
do
	echo -e "\n######\ntpcc for ${num} warehouses\n######" >> ${test_out}
	go-tpc tpcc -H ${host} -P ${port} -D tpcc --warehouses ${num} --time 2m --threads 64 run >> ${test_out}
done
