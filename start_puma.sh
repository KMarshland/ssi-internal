#!/usr/bin/env bash
source ~/.bashrc
source ~/.profile
cd /var/internal && /root/.rbenv/shims/bundle exec puma -C config/puma.rb -e production