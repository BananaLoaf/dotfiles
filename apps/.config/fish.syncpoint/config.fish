set EDITOR /bin/nano
set VK_ICD_FILENAMES /usr/share/vulkan/icd.d/intel_icd.x86_64.json
set GTK_USE_PORTAL 1


function confirm
  while true
    read -l -P 'Do you want to continue? [y/N] ' resp

    switch $resp
      case Y y
        eval $argv
        return
      case '' N n
        return
    end
  end
end


alias private-home="mkdir $HOME/PRVTH; firejail --noprofile --private=$HOME/PRVTH fish"

alias logout="confirm qdbus org.kde.ksmserver /KSMServer logout 0 0 0"

alias hibernate="confirm systemctl hibernate"
