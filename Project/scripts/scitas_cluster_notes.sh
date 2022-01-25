#!/usr/bin/env bash
exit
# Don't run this, these are notes with instructions for running in 4 terminals

#############################
## SCITAS jupyter over ssh ##
#############################

## Assumptions:
# user is rajic
# conda environemnt was set up (see scitas_cluster_init.sh)


# term1
sudo openconnect -b vpn.epfl.ch --user rajic
ssh izar.epfl.ch
tmux a -t ada
Sinteract -n 40 -t 24:00:00 -m 120G -g gpu:2 -q gpu -r courses
source ada.sh
jupyter notebook --no-browser --port=8080


# term2
ssh -N -L 2222:i25:22 izar.epfl.ch


# term3
ssh -N -L 8080:localhost:8080 rajic@localhost -p 2222


# term4
ssh rajic@localhost -p 2222
tmux
htop
wgpu