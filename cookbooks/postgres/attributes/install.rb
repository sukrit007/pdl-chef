default["postgresql"]["save-node-config"] = true
case node["platform"] 
  when "centos"
    default["pgdg"]="pgdg-centos91-9.1-4.noarch.rpm"
    default["postgresql"]["package"]["base"]="postgresql91"
    default["postgresql"]["package"]["server"]="#{default["postgresql"]["package"]["base"]}-server"
    default["postgresql"]["package"]["libs"]="#{default["postgresql"]["package"]["base"]}-libs"
    default["postgresql"]["package"]["contrib"]="#{default["postgresql"]["package"]["base"]}-contrib"
    default["postgresql"]["package"]["devel"]="#{default["postgresql"]["package"]["base"]}-devel"
    default["postgresql"]["package-options"]="--nogpgcheck"
  when "ubuntu"
    default["postgresql"]["package"]["base"]="postgresql-9.1"
    default["postgresql"]["package"]["contrib"]="postgresql-contrib-9.1"
    default["postgresql"]["package-options"]=""
end


#node["postgresql"]["package"]["server"]="#{node["postgresql"]["package"]}-server"
#node["postgresql"]["package"]["libs"]="#{node["postgresql"]["package"]}-libs"
#node["postgresql"]["package"]["contrib"]="#{node["postgresql"]["package"]}-contrib"
#node["postgresql"]["package"]["devel"]="#{node["postgresql"]["package"]}-devel"