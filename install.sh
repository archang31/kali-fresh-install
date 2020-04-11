#!/bin/bash

dpkg --add-architecture i386 && \
apt-get update && \
apt-get install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch python python3 python3-pip python3-dev libssl-dev libffi-dev wget git make procps libpcre3-dev libdb-dev libxt-dev libxaw7-dev python-pip libc6:i386 libncurses5:i386 libstdc++6:i386 && \
pip install capstone requests pwntools r2pipe && \
pip3 install pwntools keystone-engine unicorn capstone ropper && \
mkdir tools && cd tools && \
git clone https://github.com/JonathanSalwan/ROPgadget && \
git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh && \
cd .. && git clone https://github.com/pwndbg/pwndbg && cd pwndbg && git checkout stable && ./setup.sh && \
cd .. && git clone https://github.com/niklasb/libc-database && cd libc-database && ./get && \
gem install one_gadget

# Techniques to reduce base box size per:
# https://github.com/mitchellh/vagrant/issues/343
# https://gist.github.com/ADRIENBRAULT/3775253

# Remove APT cache
apt-get clean -y
apt-get autoclean -y

# Zero free space to aid VM compression
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
