if node['macosx_autologin']['enable']
  cookbook_file 'autologin.pl' do
    path "#{Chef::Config[:file_cache_path]}/autologin.pl"
    cookbook 'macosx_autologin'
    mode '0755'
    action :create
  end

  restart_loginwindow = node['macosx_autologin']['restart_loginwindow'] ? 1 : 0

  execute 'enable automatic login' do # ~FC009
    command "sudo #{Chef::Config[:file_cache_path]}/autologin.pl "\
      "#{node['macosx_autologin']['username']} #{node['macosx_autologin']['password']} #{restart_loginwindow}"
    sensitive true
  end
else
  execute 'delete autoLoginUser from com.apple.loginwindow' do
    command "sudo defaults delete /Library/Preferences/com.apple.loginwindow \"autoLoginUser\""
    returns [0, 1]
  end

  execute 'delete /etc/kcpassword' do
    command 'sudo rm -f /etc/kcpassword'
  end

  execute 'restart loginwindow' do
    command 'sudo killall loginwindow'
    only_if { node['macosx_autologin']['restart_loginwindow'] }
  end
end
