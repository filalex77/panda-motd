#!/bin/sh

rm *.gem
gem build panda-motd.gemspec
scp panda-motd*.gem taylor@taylorjthurlow.com:~/temp/pandamotd.gem
ssh -t taylor@taylorjthurlow.com "cd ~/temp && \
                                  sudo gem uninstall -x panda-motd && \
                                  sudo gem install ./*.gem && \
                                  echo '---------------------' && \
                                  sudo panda-motd /home/taylor/.config/panda-motd.yaml && \
                                  echo '---------------------'"
