from app.responses import success_response, error_response
from app.users import get_user

def route(event):

    method = event["requestContext"]["http"]["method"]
    path = event["rawPath"]

    # GET /users/{id}
    if method == "GET" and path.startswith("/users/"):

        try:
            user_id = int(path.split("/")[-1])
        except ValueError:
            return error_response(
                code="INVALID_USER_ID",
                message="user_id must be integer",
                status_code=400
            )

        data = get_user(user_id)

        return success_response(data)

    return error_response(
        code="NOT_FOUND",
        message="Route not found",
        status_code=404
    )
