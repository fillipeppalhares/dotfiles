set fish_greeting ""
set -x PATH $HOME/.rbenv/bin $HOME/.rbenv/shims $HOME/.rbenv/bin $PATH

if not pgrep -x 'postgres' > /dev/null
    sudo service postgresql start
end

redis-server --daemonize yes

cd projects/acsiv
