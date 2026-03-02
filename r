import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

formatter = logging.Formatter(
    "%(levelname)s [%(name)s] %(message)s"
)

for handler in logger.handlers:
    handler.setFormatter(formatter)
