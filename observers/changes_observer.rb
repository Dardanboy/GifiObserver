require_relative 'observer_pattern_observer'
require_relative '../notifiers/message_box_notifier'
class ChangesObserver < ObserverPatternObserver

  def initialize
    super
  end

  def notify(changes)
    if changes.any?
      puts "ChangesObserver.notify #{changes}"
      changes.each do |change|
        if change =~ /<div title=".*">/imu # If the change contain <div title="...."> this means new notes have been added. We could have done a chain responsibility here but let's keep it simple
            MessageBoxNotifier.notify('Changes', 'Changes has been detected, a new mark is certainly available on Gifi !')
        end
      end
    end
  end
end