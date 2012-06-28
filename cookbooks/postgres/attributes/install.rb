default["postgresql"]["package"]="postgresql-9.1"

case node["platform"] 
  when "centos"
    default["pgdg"]="pgdg-centos91-9.1-4.noarch.rpm"  
  when "ubuntu"
end
