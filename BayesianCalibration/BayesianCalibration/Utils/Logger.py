import logging

class Logger():
    
    def getLogger(self, name, level, formatter, log_file_path):
        logger = logging.getLogger(name)
        consoleHandler = logging.StreamHandler()
        consoleHandler.setFormatter(logging.Formatter(formatter))
        if len(logger.handlers) > 0:
            logger.handlers = []
        logger.addHandler(consoleHandler)
        if log_file_path is not None:
            fileHandler = logging.FileHandler(log_file_path)
            fileHandler.setFormatter(logging.Formatter(formatter))
            logger.addHandler(fileHandler); 
        logger.setLevel(level)
        logger.propagate = False
        return logger