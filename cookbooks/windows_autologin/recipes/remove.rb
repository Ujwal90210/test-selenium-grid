WINLOGON_KEY =  'HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'

registry_key 'disable autologin' do
  key WINLOGON_KEY
  values [{ name: 'AutoAdminLogon', type: :string, data: '0' }]
  action :create
end

registry_key 'delete autologin password' do
  key WINLOGON_KEY
  values [{ name: 'DefaultPassword', type: :string, data: nil }]
  action :delete
end
