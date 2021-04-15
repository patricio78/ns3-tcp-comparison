#!/bin/bash

ALGORITHMS=(TcpLinuxReno TcpNewReno TcpCubic)

for item in ${ALGORITHMS[@]}; do
  echo "----- Simulating $item -----"
  ./waf --run "my-tcp-variants-comparison --error_p=0.004 --sack=False --transport_prot=$item --prefix_name='data/$item' --tracing=True --duration=60"
done

python3 ./plottcpalgo.py
