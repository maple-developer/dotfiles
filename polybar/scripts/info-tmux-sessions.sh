#! /bin/sh

if sessionlist=$(tmux ls 2>/dev/null); then
    # printf "# "
    printf "tmux: "

    echo "$sessionlist" | while read -r line; do
        session=$(echo "$line" | cut -d ':' -f 1)

        if echo "$line" | grep -q "(attached)"; then
            status="(a)"
        else
            status=""
        fi

        printf "%s%s " "$session" "$status"
    done

    printf "\n"
else
    # printf "# none\n"
    printf "tmux: none\n"
fi
