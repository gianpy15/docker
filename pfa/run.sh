#!/bin/bash

rm -rf /exp/workspace/PhysicsForAffordances/build/*
cd /exp/workspace/PhysicsForAffordances/build
cmake ..
make DataCreator -j10
Xvfb :19 -screen 0 1024x768x16 &
/exp/Libraries/conda/envs/pfa/bin/python3.7 /exp/workspace/PhysicsForAffordances/python/source/data_creation/tasker.py $1 --logstdout --logstderr
