#
# Gifi Observer
# Script done for CPNV students that are in IT section only (and that have their marks put/updated on Gifi)
#
# Used to know whether there is a new mark available on the Gifi (<<cpnv's intranet link>>.ch/gifi/index.php)
# This is mostly used because refreshinga manually the Gifi page to look whether there is a new mark or not is time consuming so why not to do a script that alerts on changes ?
# Author: Dardan Iljazi
# TODO: - Add checker to know the user is online/offline (--> when cookie are not set (properly), offline mode is called)

require_relative 'gifi_observer'

gifi_observer = GifiObserver.new
gifi_observer.set_cookie("COOKIE for intranet.cpnv.ch HERE !")
gifi_observer.run # Will do an infinite loop inside, can use an argument to set the delay between each loop, by default is set to 15 (seconds)