function fffoldl
    if test (count $argv) -le 2 > /dev/null ^&1
        ffpart "fffoldl $argv"
    else
        set fun (ffwrap $argv[1])

        set tmp $argv[2]

        for arg in $argv[3..-1]
            set tmp (eval $fun $tmp $arg)
        end

        echo $tmp
    end
end
