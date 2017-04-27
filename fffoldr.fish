function fffoldr
    if test (count $argv) -le 2 > /dev/null ^&1
        ffpart "fffoldr $argv"
    else
        fffoldl $argv[1..2] $argv[-1..3]
    end
end
