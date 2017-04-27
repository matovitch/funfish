function ffpipe
    while read -a args
        eval $argv $args
    end
end
