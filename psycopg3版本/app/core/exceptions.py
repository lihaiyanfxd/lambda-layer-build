from fastapi import FastAPI, Request, HTTPException
from fastapi.exceptions import RequestValidationError
from .responses import error_response


# 自定义业务异常
class BusinessException(Exception):
    def __init__(self, code: str, message: str, status_code: int = 400):
        self.code = code
        self.message = message
        self.status_code = status_code


def register_exception_handlers(app: FastAPI):

    # 处理 HTTPException
    @app.exception_handler(HTTPException)
    async def http_exception_handler(request: Request, exc: HTTPException):
        return error_response(
            status_code=exc.status_code,
            code="HTTP_ERROR",
            message=exc.detail
        )

    # 处理参数校验错误（422）
    @app.exception_handler(RequestValidationError)
    async def validation_exception_handler(request: Request, exc: RequestValidationError):
        return error_response(
            status_code=400,
            code="VALIDATION_ERROR",
            message="Invalid request parameters"
        )

    # 处理自定义业务异常
    @app.exception_handler(BusinessException)
    async def business_exception_handler(request: Request, exc: BusinessException):
        return error_response(
            status_code=exc.status_code,
            code=exc.code,
            message=exc.message
        )

    # 处理未知异常（最重要）
    @app.exception_handler(Exception)
    async def global_exception_handler(request: Request, exc: Exception):
        return error_response(
            status_code=500,
            code="INTERNAL_SERVER_ERROR",
            message="Internal server error"
        )
