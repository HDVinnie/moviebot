#
# Platform mock
#

class PlatformMock

  attr :disc_in_drive
  
  def initialize
    @disc_in_drive = false
  end

  def disc_present?
    disc_in_drive
  end
  
  def eject
    true
  end

end

PLATFORM = PlatformMock.new
