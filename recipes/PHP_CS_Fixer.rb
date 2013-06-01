# To change this template, choose Tools | Templates
# and open the template in the editor.

if platform_family?("rhel")
  php_cs_fixer_binary = "/usr/bin/php-cs-fixer"
else
  php_cs_fixer_binary = "/usr/local/bin/php-cs-fixer"
end

remote_file "#{php_cs_fixer_binary}" do
  source "#{node['phpcsfixer']['download_url']}"
  owner 'root'
  group 'root'
  mode "0775"
  not_if { ::File.exists?(php_cs_fixer_binary) }
end
