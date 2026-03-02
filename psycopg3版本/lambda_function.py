from fastapi import FastAPI
from mangum import Mangum

from app.api.users import router as users_router
from app.core.logger import setup_logging
from app.core.logger import request_logging_middleware
from app.core.exceptions import register_exception_handlers


# 初始化 logging
setup_logging()

app = FastAPI()

# request logging middleware
app.middleware("http")(request_logging_middleware)

# router
app.include_router(users_router)

# exception handler
register_exception_handlers(app)

handler = Mangum(app)
