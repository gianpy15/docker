rm -rf /root/workspace/PhysicsForAffordances/build/*
cd /root/workspace/PhysicsForAffordances/build
cmake ..
make DataCreator -j4
Xvfb :19 -screen 0 1024x768x16 &
/root/Libraries/conda/envs/pfa/bin/python3.7 /root/workspace/PhysicsForAffordances/python/source/data_creation/tasker.py $1 --logstdout --logstderr
