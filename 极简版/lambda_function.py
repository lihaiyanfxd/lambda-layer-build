from fastapi import FastAPI
from mangum import Mangum

from app.api.main import api_router

app = FastAPI()

app.include_router(api_router)

handler = Mangum(app)
