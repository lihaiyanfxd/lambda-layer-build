from fastapi.responses import JSONResponse


def success_response(data=None):
    return JSONResponse(
        status_code=200,
        content={
            "success": True,
            "data": data
        }
    )


def error_response(status_code: int, code: str, message: str):
    return JSONResponse(
        status_code=status_code,
        content={
            "success": False,
            "code": code,
            "message": message
        }
    )
