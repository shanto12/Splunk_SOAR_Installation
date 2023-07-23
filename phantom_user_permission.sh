if [ -f /etc/cron.allow ]; then
    if grep -q '^phantom$' /etc/cron.allow; then
        echo yes
    else
        echo no
    fi
elif [ -f /etc/cron.deny ]; then
    if grep -q '^phantom$' /etc/cron.deny; then
        echo no
    else
        echo yes
    fi
else
    echo yes
fi
