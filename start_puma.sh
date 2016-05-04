#!/usr/bin/env bash
printf "Trying to boot the bastard\n" >> /home/ubuntu/internal/log/upstart.log
source /home/ubuntu/.bashrc
source /home/ubuntu/.profile
source /home/ubuntu/.bash_profile
cd /home/ubuntu/internal && /home/ubuntu/.rbenv/shims/bundle exec /home/ubuntu/.rbenv/shims/puma -C config/puma.rb -e production