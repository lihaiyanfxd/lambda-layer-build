import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

formatter = logging.Formatter(
    "%(asctime)s %(levelname)s [%(name)s] %(message)s"
)

for h in logger.handlers:
    h.setFormatter(formatter)
