

case node["platform"] 
  when "centos"
    default["pgdg"]="pgdg-centos91-9.1-4.noarch.rpm"
    default["postgresql"]["package"]="postgresql91*"  
  when "ubuntu"
    default["postgresql"]["package"]="postgresql-9.1"
end
