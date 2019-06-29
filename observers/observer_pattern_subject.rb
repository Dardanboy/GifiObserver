class ObserverPatternSubject
  attr_accessor :observers

  def initialize
    @observers = []
  end

  def register_observer(observer)
    @observers.push(observer)
  end

  def notify_observers(data)
    @observers.each do |observer|
      observer.notify(data)
    end
  end
end