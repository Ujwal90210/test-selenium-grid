def safari_version(type = 'CFBundleShortVersionString')
  return unless platform?('mac_os_x')
  cmd = Mixlib::ShellOut
        .new("/usr/libexec/PlistBuddy -c 'print :#{type}' /Applications/Safari.app/Contents/version.plist")
  cmd.run_command
  cmd.error!
  cmd.stdout.strip
end
