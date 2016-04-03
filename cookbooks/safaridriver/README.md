# Selenium SafariDriver Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/safaridriver.svg?style=flat-square)][supermarket]
[![Build Status](http://img.shields.io/travis/dhoer/chef-safaridriver.svg?style=flat-square)][travis]

[supermarket]: https://supermarket.chef.io/cookbooks/safaridriver
[travis]: https://travis-ci.org/dhoer/chef-safaridriver

Installs SafariDriver (https://github.com/SeleniumHQ/selenium/wiki/SafariDriver).

## Requirements

- Mac OS X 10.8+
- Chef 11.16+

### Platforms

- Mac OS X

### Cookbooks

- safari 
- macosx_gui_login 

## Usage

Include cookbook in recipe or run list to install SafariDriver. Username and password are required to login to GUI.  

### Attributes

- `node['safaridriver']['username']` - Username to login as. Required.
- `node['safaridriver']['password']` -  Password of username. Required.
- `node['safaridriver']['url']` - URL of SafariDriver to download.

### Example

#### Install selenium node with safari capability

```ruby
username = 'username'
password = 'password'

node.set['safaridriver']['username'] = username
node.set['safaridriver']['password'] = password

include_recipe 'safaridriver'

node.set['selenium']['node']['username'] = username
node.set['selenium']['node']['password'] = password
node.set['selenium']['node']['capabilities'] = [
  {
    browserName: 'safari',
    maxInstances: 1,
    version: safari_version,
    seleniumProtocol: 'WebDriver'
  }
]

include_recipe 'selenium::node'
```

## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/safaridriver).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-safaridriver/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-safaridriver/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-safaridriver/blob/master/LICENSE.md) file for details.
