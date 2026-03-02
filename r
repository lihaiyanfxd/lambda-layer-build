from app.responses import success_response, error_response
from app.users import get_user
from app.exceptions import BusinessException
import logging

logger = logging.getLogger(__name__)

def route(event):
    logger.info("route() start")
    
    method = event["httpMethod"]
    path = event["resource"]  

    if method == "GET" and path == "/item":

        query = event.get("queryStringParameters") or {}

        try:
            user_id = int(query.get("id"))
        except (ValueError, TypeError):
            return error_response(
                code="INVALID_ID",
                message="id must be integer",
                status_code=400
            )
        if user_id ==  0:
            logger.error(f"user_idは{user_id}が入力しました")

            raise BusinessException(
                code="USER_NOT_FOUND",
                message = "User does not exist",
                status_code = 404
            )
        else:
            data = get_user(user_id)

        logger.info("route() end")
        return success_response(data)

    return error_response(
        code="NOT_FOUND",
        message="Route not found",
        status_code=404
    )
