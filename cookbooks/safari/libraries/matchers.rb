if defined?(ChefSpec)
  def install_safari_extension(safariextz)
    ChefSpec::Matchers::ResourceMatcher.new(:safari_extension, :install, safariextz)
  end
end
