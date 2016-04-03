# Windows Autologin Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/windows_autologin.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-windows_autologin.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-windows_autologin.svg?style=flat-square)][github]

[cookbook]: https://supermarket.chef.io/cookbooks/windows_autologin
[travis]: https://travis-ci.org/dhoer/chef-windows_autologin
[github]: https://github.com/dhoer/chef-windows_autologin/issues

Enables/disables automatic logon using Windows 
[AutoAdminLogon](https://technet.microsoft.com/en-us/library/cc939702.aspx).
 
Automatic logon uses the domain, username, and password stored in the registry to log users on to the computer 
when the system starts. The Log On to Windows dialog box is not displayed.

**WARNING:** Automatic logon allows other users to start your computer and to log on using your account. 
Also note that password is stored unencrypted under windows registry 
`HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon` when enabled.   
                                                  
## Requirements

- Chef 11.6.0 (includes a built-in registry_key resource) or higher 

### Platforms

- Windows

## Usage

Requires Administrator privileges. 

Enable automatic login for user

```ruby
node.set['windows_autologin']['username'] = 'username'
node.set['windows_autologin']['password'] = 'password'
node.set['windows_autologin']['domain'] = 'domain'

include_recipe[windows_autologin]
```

Disable automatic login

```ruby
include_recipe[windows_autologin::remove]
```

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-windows_autologin).
- Report bugs and discuss potential features in
[Github issues](https://github.com/dhoer/chef-windows_autologin/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-windows_autologin/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-windows_autologin/blob/master/LICENSE.md) file
for details.
