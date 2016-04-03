if platform_family?('mac_os_x')
  remote_file "#{Chef::Config[:file_cache_path]}/SafariDriver.safariextz" do
    source node['safaridriver']['url']
    checksum node['safaridriver']['checksum']
  end

  macosx_gui_login node['safaridriver']['username'] do
    password node['safaridriver']['password']
  end

  safari_extension 'SafariDriver Extension' do
    safariextz "#{Chef::Config[:file_cache_path]}/SafariDriver.safariextz"
  end
else
  Chef::Log.warn("SafariDriver cannot be installed on #{node['platform']} platform!")
end
