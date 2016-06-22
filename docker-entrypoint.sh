#!/bin/bash

uid=${UID:-1000}
gid=${GID:-1000}

id -u developer > /dev/null 2>&1
if [ $? -eq 1 ]; then
    mkdir -p /home/developer
    mkdir -p /home/developer/data
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd
    echo "developer:x:${gid}:" >> /etc/group
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer
    chmod 0440 /etc/sudoers.d/developer
    chown ${uid}:${gid} -R /home/developer
fi

su developer -c "$@"

