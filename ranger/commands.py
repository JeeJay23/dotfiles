from __future__ import (absolute_import, division, print_function)

import os

from ranger.api.commands import Command

#class open_in_new_vim(Command):
#    """:open_in_new_vim <filename>
#
#    opens file in new vim window
#    """
#
#    def execute(self):
#        os.system("nohup st -e vim " + self.rest(1) + " >/dev/null &")
#        os.system("i3-msg 'scratchpad show' ")
#        return
#
#    def tab(self, tabnum):
#        return self._tab_directory_content()
