if Gem.win_platform?
  require 'win32/api'
end

class MessageBoxNotifier
  def self.notify(title, text)
    if Gem.win_platform?
      message_box = Win32::API.new('MessageBox', "LPI", "I", 'user32')
      message_box.call(0, text, 0)
    else
      puts "\e[33m [WARNING!]: You are no on windows OS, messagebox is not yet available for this platform  \e"
      puts "\e[32m MESSAGE: #{text} \e"
    end
  end
end