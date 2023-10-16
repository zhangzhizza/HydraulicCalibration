# Author: Zhiang Zhang
# First create: 2022-04-17
# Custom exceptions

class NotResetException(Exception):
    def __init__(self, *args):
        if args:
            self.message = args[0]
        else:
            self.message = None

    def __str__(self):
        if self.message:
            return '{0}'.format(self.message)
        else:
            return 'The environment is not reset yet.'\
                        ' Call reset() first.'

class StepTimeOutException(Exception):
    def __init__(self, *args):
        if args:
            self.message = args[0]
        else:
            self.message = None

    def __str__(self):
        if self.message:
            return '{0}'.format(self.message)
        else:
            return 'The step takes too long time, check your model '\
                    'or increase timeout parameter.'
