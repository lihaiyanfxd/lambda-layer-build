import logging
import time
from fastapi import Request

logger = logging.getLogger(__name__)


async def request_logging_middleware(request: Request, call_next):

    request_id = request.headers.get("x-amzn-trace-id", "-")

    query = dict(request.query_params)

    start_time = time.time()

    logger.info(
        f"START request_id={request_id} "
        f"{request.method} {request.url.path} "
        f"query={query}"
    )

    try:
        response = await call_next(request)

    except Exception as e:

        logger.error(
            f"ERROR request_id={request_id} "
            f"{request.method} {request.url.path} "
            f"{str(e)}"
        )

        raise

    duration = int((time.time() - start_time) * 1000)

    logger.info(
        f"END request_id={request_id} "
        f"status={response.status_code} "
        f"duration={duration}ms"
    )

    return response
