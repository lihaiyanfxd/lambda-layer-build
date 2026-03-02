from fastapi import FastAPI
from mangum import Mangum

from app.api.users import router as users_router
from app.core.exceptions import register_exception_handlers
import logging

#logging.getLogger().setLevel(logging.INFO)
#logger = logging.getLogger(__name__)

logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s [%(name)s] %(message)s"
)

app = FastAPI()

app.include_router(users_router)

register_exception_handlers(app)

lambda_handler = Mangum(app, api_gateway_base_path="/prod")
