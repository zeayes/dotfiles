# -*- coding: utf-8 -*-

flags = [
    '-Wall',
    '-Werror',
    '-fblocks',
    '-fobjc-runtime=macosx-10.10.2',
    '-fencode-extended-block-signature',
    '-fobjc-arc',
    '-fobjc-exceptions',
    '-fexceptions',
    '-x',
    'objective-c'
]

SOURCE_EXTENSIONS = ['.cpp', '.cxx', '.cc', '.c', '.m', '.mm']

def FlagsForFile(filename, **kwargs):
    return {'flags': flags, 'do_cache': True}
