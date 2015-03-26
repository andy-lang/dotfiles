import sublime, sublime_plugin

class PydevCommand(sublime_plugin.WindowCommand):
    def run(self):
        self.window.run_command('set_layout', {"cols":[0.0, 1.0], "rows":[0.0, 0.5, 1.0], "cells":[[0, 0, 1, 1], [0, 1, 1, 2]]})
        self.window.run_command('repl_open',{"type": "subprocess",
                                             "encoding": "utf8",
                                             "cmd": ["python2.7", "-i", "-u", "$file"],
                                             "cwd": "$file_path",
                                             "syntax": "Packages/Python/Python.tmLanguage",
                                             "external_id": "python2.7"
                                             })
        self.window.run_command('move_to_group', { "group": 1 }) 