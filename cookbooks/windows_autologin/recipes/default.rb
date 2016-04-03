registry_key "set autologon for #{node['windows_autologin']['username']}" do
  key 'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
  values [
    { name: 'AutoAdminLogon', type: :string, data: '1' },
    { name: 'DefaultUsername', type: :string, data: node['windows_autologin']['username'] },
    { name: 'DefaultPassword', type: :string, data: node['windows_autologin']['password'] },
    { name: 'DefaultDomainName', type: :string, data: node['windows_autologin']['domain'] }
  ]
  action :create
end
