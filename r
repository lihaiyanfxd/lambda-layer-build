from router import route
from responses import error_response
from exceptions import BusinessException

def lambda_handler(event, context):
    print(event)

    try:
        return route(event)

    # 业务异常
    except BusinessException as e:
        return error_response(
            code=e.code,
            message=e.message,
            status_code=e.status_code
        )

    # 未知异常
    except Exception:
        return error_response(
            code="INTERNAL_SERVER_ERROR",
            message="Internal server error",
            status_code=500
        )
