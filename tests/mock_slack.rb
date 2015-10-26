class SlackMock
  
  attr :history

  def initialize
    @history = []
  end
  
  def say(s)
    Thread.new { COMMANDS.handle_command(s) }.join
  end
  
  def notify(s)
    @history << s
  end

end
