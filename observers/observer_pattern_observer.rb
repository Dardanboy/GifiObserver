class ObserverPatternObserver
  attr_accessor :changes

  def update(subject_changes)
    @changes = subject_changes
  end
end