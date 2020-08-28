#!/bin/bash

tests=(oltp_point_select oltp_update_index oltp_read_only oltp_write_only oltp_read_write)
test_out=./sysbench_test_out

threads_number=(8 16 32 64 128)

for t in ${tests[@]}
do
  for th in ${threads_number[@]}
  do
    echo -e "\n######\n${t} for ${th} threads\n######\n" >> ${test_out}
    sysbench --config-file=./sysbench_config ${t} --tables=32 --table-size=400000 --threads=${th} run >> ${test_out}
  done
done
