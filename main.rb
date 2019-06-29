#
# Gifi Observer
# Script done for CPNV students that are in IT section only (and that have their marks put/updated on Gifi)
#
# Used to know whether there is a new mark available on the Gifi (<<cpnv's intranet link>>.ch/gifi/index.php)
# This is mostly used because refreshinga manually the Gifi page to look whether there is a new mark or not is time consuming so why not to do a script that alerts on changes ?
# Author: Dardan Iljazi
# TODO: - Add checker to know if we are online/offline
# TODO: - Add checker to know if the diffs are marks changes

require_relative 'gifi_observer'

gifi_observer = GifiObserver.new
gifi_observer.set_cookie("COOKIE for intranet.cpnv.ch HERE !")

require_relative 'notifiers/message_box_notifier'
MessageBoxNotifier.notify('test', 'test')
loop do
  gifi_observer.run
  puts gifi_observer.diffs
  sleep(5)
end