function fish_greeting
    if command -v neofetch > /dev/null
        if command -v lolcat > /dev/null
            neofetch | lolcat
        else
            neofetch
        end
    end
end 
