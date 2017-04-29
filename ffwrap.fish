function ffwrap
    set fun $argv[1]

    set fun (echo $fun | sed 's/\\\\@/ESCAPED_AT/g')

    if echo $fun | grep -v '@' > /dev/null ^&1
        set fun "$fun @@"
    end

    set fun (echo $fun | sed 's/@@/\$argv/g')
    set fun (echo $fun | sed 's/@\([0-9]\)/\$argv[\1]/g')
    
    set fun (echo $fun | sed 's/ESCAPED_AT/@/g')

    set file (mktemp)
    
    if test (count $argv) -ge 2 > /dev/null ^&1
        set name $argv[2]
    else
        set name (cat /dev/urandom | tr -cd '[:alnum:]' | head -c 9; echo)
    end

    echo "#!/bin/fish"       >> $file

    echo "function $name" >> $file
    echo "    $fun"          >> $file
    echo "end"               >> $file

    chmod +x $file
    source $file

    if test (count $argv) -lt 2 > /dev/null ^&1
        echo $name
    end
end
