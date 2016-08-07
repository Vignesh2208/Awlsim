# PLCNet (Awlsim + S3FNet + TimeKeeper)
```
Awlsim is a free Step 7 compatible AWL/STL Soft-PLC written in Python.
Depending on the host machine and the Python interpreter used, it achieves
good performance of several thousand to millions of AWL/STL instructions
per second. German and English S7 AWL/STL mnemonics are supported.

This project integrates Awlsim with TimeKeeper and S3FNet to achieve
high fidelity large scale PLC Network emulations. It also allows
the user to implement and test intrusion detection algorithms and
subject the network to variety of man in the middle attack scenarios.

```

## Building Source
```

#edit CONFIG.txt to set parameters prior to Building
N_CPUS 	# Number of VCPUs assigned for experiments
NR_SERIAL_DEVS 	# Number of serial device interfaces assigned for each emulated PLC
TX_BUF_SIZE 	# Transmission buffer size (bytes) for assigned serial device interfaces
TIMEKEEPER_DIR	# Absolute path to the location of TimeKeeper source

# build source
sudo make fullbuild
```

## Launching a new Project
```
# create new project
sudo ./run.sh -n <Project name> -m

# make changes to the project
# set experiment configuration
edit Projects/<Project name>/conf/exp_config

# set topology configuration
edit Projects/<Project name>/conf/topology_config

# build project 
sudo ./run.sh -n <Project name> -l

# run last built project
sudo ./run.sh -n <Project name> -r
```

## Advanced Security testing
```  
# Man in the Middle Attacks
edit Projects/<Project name>/conf/cApp_inject_attack.cc
edit Projects/<Project name>/conf/cApp_session.h
Rebuild Project after editing

# Output Logs Containing Send/Recv Modbus messages
Projects/<Project name>/conf/logs

# Centralized Log collector (can be modified to act as centralized & simulated Intrusion monitor)
edit Projects/<Project name>/conf/PLC_Config/udp_reader.py
```