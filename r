from app.responses import success_response, error_response
from app.users import get_user

def route(event):

    method = event["requestContext"]["http"]["method"]
    path = event["rawPath"]

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

        data = get_user(user_id)

        return success_response(data)

    return error_response(
        code="NOT_FOUND",
        message="Route not found",
        status_code=404
    )
