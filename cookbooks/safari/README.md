# Safari Cookbook

[![Cookbook Version](http://img.shields.io/cookbook/v/safari.svg?style=flat-square)][cookbook]
[![Build Status](http://img.shields.io/travis/dhoer/chef-safari.svg?style=flat-square)][travis]
[![GitHub Issues](http://img.shields.io/github/issues/dhoer/chef-safari.svg?style=flat-square)][github]

[cookbook]: https://supermarket.chef.io/cookbooks/safari
[travis]: https://travis-ci.org/dhoer/chef-safari
[github]: https://github.com/dhoer/chef-safari/issues

This cookbook provides a `safari_version` library method to retrieve Safari version installed, and a
`safari_extension` resource to install Safari extensions.

## Requirements

- User must be logged into GUI before calling safari_extension (see 
[macosx_gui_login](https://supermarket.chef.io/cookbooks/macosx_gui_login) cookbook)
- Chef 11.14 or higher (sensitive attribute introduced)

### Platforms

- Mac OS X Mavericks (10.9) or higher

## Usage

Include the safari as a dependency to make library method and extension resource available.

### safari_version

The safari_version retrieves CFBundleShortVersionString by default:

```ruby
version = safari_version # => 8.0.4
```

You can return other version types by passing the name (e.g. BuildVersion, CFBundleVersion, ProjectName or
SourceVersion)

```ruby
bundle_version = safari_version('CFBundleVersion') # => 10600.4.10.7
```

**Tip:** use allow_any_instance_of to stub safari_version method when testing with rspec:

```ruby
allow_any_instance_of(Chef::Recipe).to receive(:safari_version).and_return('8.0.4')
```

### safari_extension

Installs Safari extensions. User must be logged into GUI before calling safari_extension (see 
[macosx_gui_login](https://supermarket.chef.io/cookbooks/macosx_gui_login) cookbook).

#### Attribute

- `safariextz` (required) - Path to Safari extension to install. Defaults to the name of the resource block.

#### Example

Install a Safari extension:

```ruby
safari_extension 'a safari extension' do
  safariextz '/path/to/a.safariextz'
  action :install
end
```

## ChefSpec Matchers

This cookbook includes a custom [ChefSpec](https://github.com/sethvargo/chefspec) matcher you can use to test your
own cookbooks.

Example Matcher Usage

```ruby
expect(chef_run).to install_safari_extension('a safari extension').with(
  safariextz: '/path/to/a.safariextz')
```

Cookbook Matcher

- install_safari_extension(safariextz)


## Getting Help

- Ask specific questions on [Stack Overflow](http://stackoverflow.com/questions/tagged/chef-safari).
- Report bugs and discuss potential features in [Github issues](https://github.com/dhoer/chef-safari/issues).

## Contributing

Please refer to [CONTRIBUTING](https://github.com/dhoer/chef-safari/blob/master/CONTRIBUTING.md).

## License

MIT - see the accompanying [LICENSE](https://github.com/dhoer/chef-safari/blob/master/LICENSE.md) file for details.
