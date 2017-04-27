function ffpart
    set fun (echo $argv[1] | sed 's/@/\\\\@/g')" @@"
    
    if begin; test (count $argv) -gt 1; end
        ffwrap $fun $argv[2]
    else
        ffwrap $fun
    end
end

