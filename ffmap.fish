function ffmap
    set fun (ffwrap $argv[1])

    for arg in $argv[2..-1]
        eval $fun $arg
    end
end
