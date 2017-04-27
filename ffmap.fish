function ffmap
    if test (count $argv) -eq 1 > /dev/null ^&1
        ffpart "ffmap $argv[1]"
    else
        set fun (ffwrap $argv[1])

        for arg in $argv[2..-1]
            eval $fun $arg
        end
    end
end
