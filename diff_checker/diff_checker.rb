require_relative 'diff_checker_factory_algorithm'
require_relative '../observers/observer_pattern_subject'

class DiffChecker < ObserverPatternSubject
  attr_accessor :result_1, :result_2, :index, :changes, :diff_checker_algorithm

  def initialize
    super
    self.index = 1
    self.changes = []
    self.diff_checker_algorithm = DiffCheckerFactoryAlgorithm.use('Nokogiri')
  end

  def add_data(result)
    self.result_1 = result if self.index == 1
    self.result_2 = result if self.index == 2

    self.index = (self.index == 2) ? 1 : 2
  end

  def check_for_diffs
    self.changes.clear

    if self.result_1 != nil and self.result_2 != nil
      self.changes = self.diff_checker_algorithm.data_diffs(self.result_1, self.result_2)
    end
  end

  def has_changes?
    !self.changes.empty?
  end

  def changes=(change)
    @changes = change
    notify_observers(self.changes)
  end
end
