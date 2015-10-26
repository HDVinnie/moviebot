#
# Platform-specific behavior
#

PLATFORM = case RUBY_PLATFORM
when /win32/
  Mac.new
# when /linux/
#   LinuxPlatform.new
else
  log :error, "Sorry, we don't support platform #{RUBY_PLATFORM}."
  exit 1
end

class MacPlatform
  
  def disc_present?
    external('/usr/bin/drutil status', silent: true).lines.grep(/No Media/).empty?
  end
  
  def eject
    result, timing = external_with_timing '/usr/bin/drutil eject'
    log :info, "eject said: [#{result}] in #{timing}"
  end
  
end
