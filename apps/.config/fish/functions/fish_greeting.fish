function fish_greeting
    set GREETING ""
    # Check for neofetch
    if command -v neofetch > /dev/null
        
        # Check for buddhasay and roll the dice to be 1
        if command -v buddhasay > /dev/null && [ 1 -eq (shuf -i 1-6 -n 1) ]
            set GREETING "$GREETING buddhasay"
        else
            set GREETING "$GREETING neofetch"
        end

    else
        exit
    end

    # Color it, if possible, print
    if command -v lolcat > /dev/null
        fish -c "$GREETING" | lolcat
    else
        fish -c "$GREETING"
    end
end 
