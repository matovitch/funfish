function ffpart
    function toWrap
        echo (echo $argv | sed 's/@/\\\\@/g')" @@"
    end
    
    if begin; test (count $argv) -gt 1; end
        ffwrap (toWrap $argv[2]) $argv[1]
    else
        ffwrap (toWrap $argv[1])
    end
end

