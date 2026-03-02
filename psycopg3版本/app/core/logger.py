import logging
import time
from fastapi import Request


def setup_logging():

    root_logger = logging.getLogger()
    root_logger.setLevel(logging.INFO)

    if not root_logger.handlers:

        handler = logging.StreamHandler()

        formatter = logging.Formatter(
            "%(levelname)s [%(name)s] %(message)s"
        )

        handler.setFormatter(formatter)

        root_logger.addHandler(handler)


logger = logging.getLogger("request")


async def request_logging_middleware(request: Request, call_next):

    start_time = time.time()

    logger.info(f"START {request.method} {request.url.path}")

    try:
        response = await call_next(request)

    except Exception as e:
        logger.error(f"EXCEPTION {request.method} {request.url.path} {str(e)}")
        raise

    duration = int((time.time() - start_time) * 1000)

    logger.info(
        f"END {request.method} {request.url.path} "
        f"status={response.status_code} time={duration}ms"
    )

    return response
