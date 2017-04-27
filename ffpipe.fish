function ffpipe
    while read -a args
        eval $argv $args
    end
    #to avoid returning on error
    test true
end
