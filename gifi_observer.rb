require_relative 'http_request'
require_relative 'diff_checker/diff_checker'
require_relative 'observers/changes_observer'

class GifiObserver
  attr_accessor :diff_checker, :http_request, :response_data, :changes_observer

  def initialize
    self.http_request = HttpRequest.new('http://intranet.cpnv.ch/gifi/index.php')
    self.diff_checker = DiffChecker.new
    self.changes_observer = ChangesObserver.new
    self.diff_checker.register_observer(self.changes_observer)
  end

  def set_cookie(cookie)
    http_request.set_header([['Cookie', cookie]])
  end

  def run
    response_data = http_request.get_html
    diff_checker.add_data(response_data) # add_data will wait until 2 different data are set (with add_data) and will check their difference after each call afterwards
  end

  def diffs
    diff_checker.diffs
  end
end