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
gifi_observer.set_cookie("_intranet_session=BAh7CzoPc2Vzc2lvbl9pZEkiJWRiMDM0Zjc1NDljOTAwNDdkYzRmNWMwZWU4MDkxMzQ2BjoGRUY6EF9jc3JmX3Rva2VuSSIxK05zZ3B6YnZ1Mno3dEJQTVpwR0VFREV0R0dReHRrVTM3NGgyMUJqSVZlWT0GOwZGSSIVdXNlcl9jcmVkZW50aWFscwY7BkZJIgGAOGQ4Yjg1MGUxMjdkMGNiNDMzNTg5M2E2YjJkNDdiMjEwYTkxMTE3NWJjNmFlZmMxN2FmNTM4ZmQ1OGIxMzVlZTY3ZjA5Njk0ZDNmZTY0MTFkYjM5ZjdmYTcxZTVmY2MzZGQzNGM1MWY2N2E4YjQ5OWFkMGM0NTE5YTcyMmFhYjUGOwZUSSIYdXNlcl9jcmVkZW50aWFsc19pZAY7BkZpAjolOhFyZWNlbnRfcGFnZXNbB3sHSSIJbmFtZQY7BlRJIhJJTEpBWkkgRGFyZGFuBjsGVEkiCHVybAY7BlQiHS9ldHVkaWFudHMvZGFyZGFuX2lsamF6aXsHSSIJbmFtZQY7BlRJIgxBY2N1ZWlsBjsGVEkiCHVybAY7BlQiBi86G3Blb3BsZV9zaG93X2V4cGlyZXNfYXRJdToJVGltZQ2p1x2AOlXiYAo6DW5hbm9fbnVtaQJGAToNbmFub19kZW5pBjoNc3VibWljcm8iBzJgOgtvZmZzZXRpAiAcOgl6b25lSSIJQ0VTVAY7BlQ%3D--6a20b36bc53840fcf5078b325f8f0b5df075f241; user_credentials=8d8b850e127d0cb4335893a6b2d47b210a911175bc6aefc17af538fd58b135ee67f09694d3fe6411db39f7fa71e5fcc3dd34c51f67a8b499ad0c4519a722aab5%3A%3A9530")

require_relative 'notifiers/message_box_notifier'
MessageBoxNotifier.notify('test', 'test')
loop do
  gifi_observer.run
  puts gifi_observer.diffs
  sleep(5)
end