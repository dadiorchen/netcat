#/bin/bash
mkfifo tmp
mkfifo tmp2
nc -l 8088 -k > tmp < tmp2 &
while true; do
  openssl s_client -connect news.ycombinator.com:443 -quiet < tmp > tmp2
done
